import db from '../core/Database.js';

class DashboardCategoryController {

  static async index(req, res) {
    try {
      const [rows] = await db.query(`
		  SELECT * FROM category`);

      res.render('dashboard/category', { 
		    category: rows
	    });
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat mengambil data.');
    }
  }

  static async create(req, res) {
      res.render('dashboard/category-create', { 
        message: 'Hello from DashboardController!' 
      });
  }

  static async createProccess(req, res) {
    const { category } = req.body;
  
    try {
      await db.query(
        'INSERT INTO category (category) VALUES (?)',
        [category]
      );
      res.redirect('/dashboard/category');
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat menyimpan data.');
    }
  }  

  static async edit(req, res) {
    const { id } = req.params;
    try {
      const [categoryRows] = await db.query('SELECT * FROM category WHERE id = ?', [id]);

      if (categoryRows.length === 0) {
        return res.status(404).send('Category tidak ditemukan.');
      }

      res.render('dashboard/category-edit', {
        category: categoryRows[0],
      });
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat mengambil data.');
    }
  }

  static async updateProcess(req, res) {
    const { category } = req.body;
    const { id } = req.params;
    try {
      await db.query('UPDATE category SET category = ? WHERE id = ?', [category, id]);

      res.redirect('/dashboard/category');
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat menyimpan data.');
    }
  }

  static async deleteCategory(req, res) {
    const { id } = req.params;
    try {
      const [categoryRows] = await db.query('SELECT * FROM category WHERE id = ?', [id]);
  
      if (categoryRows.length === 0) {
        return res.status(404).send('Category tidak ditemukan.');
      }
  
      await db.query('DELETE FROM category WHERE id = ?', [id]);
  
      res.redirect('/dashboard/category');
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat menghapus data.');
    }
  }  

}
export default DashboardCategoryController;