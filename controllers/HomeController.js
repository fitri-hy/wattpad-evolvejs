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
		
		const [settingsRows] = await db.query('SELECT * FROM settings WHERE id = 1');
		const siteTitle = `${settingsRows[0].site_title} | ${settingsRows[0].site_tagline}`;
		
      res.render('pages/index', { 
        data: stories,
		headerCategories: categoriesWithSlug,
		title: siteTitle, settings: settingsRows[0], settings: settingsRows[0]
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
          category.category AS category_name,
          comment.comment_id, 
          comment.comment_name, 
          comment.comment_email, 
          comment.comment_text 
        FROM story 
        JOIN category 
          ON story.id_category = category.id
        LEFT JOIN comment 
          ON story.id = comment.id_story
        WHERE story.title = ?
      `, [decodedSlug]);

      if (storyRows.length === 0) {
        return res.status(404).send('Story not found');
      }

      const storyData = {
        id: storyRows[0].id,
        title: storyRows[0].title,
        content: storyRows[0].content,
        img: storyRows[0].img,
        date: storyRows[0].date,
        category_id: storyRows[0].category_id,
        category_name: storyRows[0].category_name,
        comments: storyRows
          .filter(row => row.comment_id !== null)
          .map(row => ({
            comment_id: row.comment_id,
            comment_name: row.comment_name,
            comment_email: row.comment_email,
            comment_text: row.comment_text
          }))
      };

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
	  
	  
	  const [settingsRows] = await db.query('SELECT * FROM settings WHERE id = 1');
	  const siteTitle = `${storyRows[0].title} | ${settingsRows[0].site_title}`;

      res.render('pages/story-detail', { 
        story: storyData,
        latestStories: storiesWithSlug,
        headerCategories: categoriesWithSlug,
		generateSlug: HomeController.generateSlug,
		title: siteTitle, settings: settingsRows[0]
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
		
		const [settingsRows] = await db.query('SELECT * FROM settings WHERE id = 1');
		const siteTitle = `Daftar Cerita | ${settingsRows[0].site_title}`;
	  
        res.render('pages/story-list', { 
            data: stories,
            headerCategories: categoriesWithSlug,
            currentPage,
            totalPages,
            searchQuery,
			title: siteTitle, settings: settingsRows[0]
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Terjadi kesalahan saat mengambil data.');
    }
  }

  static async categoryStory(req, res) {
    const { slug } = req.params;
    const { page = 1, search = '' } = req.query;
    const limit = 8;
    const offset = (page - 1) * limit;

    try {
        const decodedSlug = decodeURIComponent(slug).replace(/-/g, ' ');

        const [categoryRows] = await db.query(`
            SELECT id, category 
            FROM category 
            WHERE category = ?
        `, [decodedSlug]);

        if (categoryRows.length === 0) {
            return res.status(404).send('Category not found');
        }

        const categoryId = categoryRows[0].id;

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
            WHERE story.id_category = ? 
            AND story.title LIKE ? 
            LIMIT ? OFFSET ?
        `, [categoryId, `%${search}%`, limit, offset]);

        const [totalStoriesCount] = await db.query(`
            SELECT COUNT(*) AS total 
            FROM story 
            WHERE id_category = ? 
            AND title LIKE ?
        `, [categoryId, `%${search}%`]);

        if (storyRows.length === 0) {
            return res.status(404).send('No stories found for this category');
        }

        const totalPages = Math.ceil(totalStoriesCount[0].total / limit);

        const storiesWithSlug = storyRows.map(story => ({
            ...story,
            slug: HomeController.generateSlug(story.title)
        }));

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

        const latestStoriesWithSlug = latestStories.map(story => ({
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
		
		
		const [settingsRows] = await db.query('SELECT * FROM settings WHERE id = 1');
		const siteTitle = `${categoryRows[0].category} | ${settingsRows[0].site_title}`;

        res.render('pages/category-list', {
            stories: storiesWithSlug,
            latestStories: latestStoriesWithSlug,
            headerCategories: categoriesWithSlug,
            categoryName: categoryRows[0].category,
            currentPage: parseInt(page),
            totalPages,
            searchQuery: search,
			title: siteTitle, settings: settingsRows[0]
        });

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
  }
  
  static async storyCommentAdd(req, res) {
    const { slug } = req.params;
    const { comment_name, comment_email, comment_text } = req.body;

    try {
      const decodedSlug = decodeURIComponent(slug).replace(/-/g, ' ');

      const [storyRows] = await db.query(`
        SELECT id FROM story WHERE title = ?
      `, [decodedSlug]);

      if (storyRows.length === 0) {
        return res.status(404).send('Story not found');
      }

      const storyId = storyRows[0].id;

      await db.query(`
        INSERT INTO comment (id_story, comment_name, comment_email, comment_text)
        VALUES (?, ?, ?, ?)
      `, [storyId, comment_name, comment_email, comment_text]);

      res.redirect(`/story/${HomeController.generateSlug(decodedSlug)}`);
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat mengirim komentar.');
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
