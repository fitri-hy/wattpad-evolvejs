import db from '../core/Database.js';

class HomeController {
  static async index(req, res) {
    try {
      const [rows] = await db.query(`
        SELECT 
          story.id, 
          story.title, 
          story.content, 
          story.img, 
          story.date, 
          category.id AS category_id, 
          category.category AS category_name 
        FROM story 
        JOIN category 
          ON story.id_category = category.id
      `);

      const stories = rows.map(story => ({
        ...story,
        slug: HomeController.generateSlug(story.title)
      }));

	  const [headerCategories] = await db.query(`
            SELECT * FROM category
        `);

        const categoriesWithSlug = headerCategories.map(category => ({
            ...category,
            slug: HomeController.generateSlug(category.category)
        }));

      res.render('pages/index', { 
        data: stories,
		headerCategories: categoriesWithSlug
      });
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat mengambil data.');
    }
  }

  static async storyDetail(req, res) {
	  const { slug } = req.params;
	  try {
		const decodedSlug = decodeURIComponent(slug).replace(/-/g, ' ');

		const [storyRows] = await db.query(`
		  SELECT 
			story.id, 
			story.title, 
			story.content, 
			story.img, 
			story.date, 
			category.id AS category_id, 
			category.category AS category_name 
		  FROM story 
		  JOIN category 
			ON story.id_category = category.id
		  WHERE story.title = ?
		`, [decodedSlug]);

		if (storyRows.length === 0) {
		  return res.status(404).send('Story not found');
		}

		const [latestStories] = await db.query(`
		  SELECT 
			story.id, 
			story.title, 
			story.content, 
			story.img, 
			story.date 
		  FROM story 
		  ORDER BY story.date DESC 
		  LIMIT 5
		`);

		const storiesWithSlug = latestStories.map(story => ({
		  ...story,
		  slug: HomeController.generateSlug(story.title)
		}));

		const [headerCategories] = await db.query(`
            SELECT * FROM category
        `);

        const categoriesWithSlug = headerCategories.map(category => ({
            ...category,
            slug: HomeController.generateSlug(category.category)
        }));

		res.render('pages/story-detail', { 
		  story: storyRows[0],
		  latestStories: storiesWithSlug,
		  headerCategories: categoriesWithSlug
		});
	  } catch (error) {
		console.error(error);
		res.status(500).send('Terjadi kesalahan saat mengambil data.');
	  }
  }

  static async storyList(req, res) {
    try {
        const itemsPerPage = 8;
        const currentPage = parseInt(req.query.page) || 1;
        const offset = (currentPage - 1) * itemsPerPage;
        const searchQuery = req.query.search || '';
        const [rows] = await db.query(`
            SELECT 
                story.id, 
                story.title, 
                story.content, 
                story.img, 
                story.date, 
                category.id AS category_id, 
                category.category AS category_name 
            FROM story 
            JOIN category 
                ON story.id_category = category.id
            WHERE story.title LIKE ? OR story.content LIKE ?
            ORDER BY story.date DESC
            LIMIT ? OFFSET ?
        `, [`%${searchQuery}%`, `%${searchQuery}%`, itemsPerPage, offset]);
        const stories = rows.map(story => ({
            ...story,
            slug: HomeController.generateSlug(story.title)
        }));
        const [[{ totalItems }]] = await db.query(`
            SELECT COUNT(*) AS totalItems FROM story
            WHERE title LIKE ? OR content LIKE ?
        `, [`%${searchQuery}%`, `%${searchQuery}%`]);
        const totalPages = Math.ceil(totalItems / itemsPerPage);
        const [headerCategories] = await db.query(`
            SELECT * FROM category
        `);
        const categoriesWithSlug = headerCategories.map(category => ({
            ...category,
            slug: HomeController.generateSlug(category.category)
        }));
        res.render('pages/story-list', { 
            data: stories,
            headerCategories: categoriesWithSlug,
            currentPage,
            totalPages,
            searchQuery
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Terjadi kesalahan saat mengambil data.');
    }
  }

  static generateSlug(title) {
    return title
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-+|-+$/g, '');
  }
}

export default HomeController;
