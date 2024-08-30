import db from '../core/Database.js';
import fs from 'fs';
import path from 'path';

class DashboardStoryController {
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
		  FROM story JOIN category 
			ON story.id_category = category.id
	  `);

      const stories = rows.map(story => ({
		...story,
		slug: DashboardStoryController.generateSlug(story.title)
      }));
	
	  const [settingsRows] = await db.query('SELECT * FROM settings WHERE id = 1');
	  const siteTitle = `Cerita | ${settingsRows[0].site_title}`;

      res.render('dashboard/story', { 
		    data: stories,
			title: siteTitle, settings: settingsRows[0]
	    });

    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat mengambil data.');
    }
  }
  
  static async create(req, res) {
    try {
      const [rows] = await db.query('SELECT * FROM category');

	  const [settingsRows] = await db.query('SELECT * FROM settings WHERE id = 1');
	  const siteTitle = `Tambah Cerita | ${settingsRows[0].site_title}`;
	  
      res.render('dashboard/story-create', { 
		data: rows,
		title: siteTitle, settings: settingsRows[0]
	  });
	  
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat mengambil data.');
    }
  }
  
  static async createProccess(req, res) {
    const { title, content, id_category } = req.body;
    const img = req.file ? req.file.filename : null; 
    const date = new Date().toISOString().slice(0, 10);

    try {
      await db.query(
        'INSERT INTO story (title, content, img, date, id_category) VALUES (?, ?, ?, ?, ?)',
        [title, content, img, date, id_category]
      );
      res.redirect('/dashboard/story');
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat menyimpan data.');
    }
  }
  
  static async edit(req, res) {
    const { id } = req.params;
    try {
      const [storyRows] = await db.query('SELECT * FROM story WHERE id = ?', [id]);
      const [categoryRows] = await db.query('SELECT * FROM category');

      if (storyRows.length === 0) {
        return res.status(404).send('Story tidak ditemukan.');
      }
	  
	  const [settingsRows] = await db.query('SELECT * FROM settings WHERE id = 1');
	  const siteTitle = `Ubah Cerita | ${settingsRows[0].site_title}`;

      res.render('dashboard/story-edit', {
        story: storyRows[0],
        categories: categoryRows,
		title: siteTitle, settings: settingsRows[0]
      });
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat mengambil data.');
    }
  }

  static async updateProcess(req, res) {
    const { title, content, id_category, oldImage } = req.body;
    const { id } = req.params;
    try {
      let image = oldImage;

      if (req.file) {
        image = req.file.filename;
      }

      await db.query('UPDATE story SET title = ?, content = ?, img = ?, id_category = ? WHERE id = ?', [title, content, image, id_category, id]);

      res.redirect('/dashboard/story');
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat menyimpan data.');
    }
  }
  
  static async deleteStory(req, res) {
    const { id } = req.params;
    try {
      const [storyRows] = await db.query('SELECT * FROM story WHERE id = ?', [id]);

      if (storyRows.length === 0) {
        return res.status(404).send('Story tidak ditemukan.');
      }

      const story = storyRows[0];
      const imagePath = path.join('public', 'assets', 'img', 'story', story.img);

      await db.query('DELETE FROM story WHERE id = ?', [id]);

      if (story.img && fs.existsSync(imagePath)) {
        fs.unlinkSync(imagePath);
      }

      res.redirect('/dashboard/story');
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat menghapus data.');
    }
  }

  static generateSlug(title) {
    return title
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-+|-+$/g, '');
  }
  
}

export default DashboardStoryController;
