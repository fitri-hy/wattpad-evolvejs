import db from '../core/Database.js';

class DashboardCommentController {

  static async index(req, res) {
    try {
      const [rows] = await db.query(`
		  SELECT * FROM comment`);

      res.render('dashboard/comment', { 
		    comment: rows
	    });
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat mengambil data.');
    }
  }
  
  static async deleteComment(req, res) {
    const { id } = req.params;
    try {
      const [categoryRows] = await db.query('SELECT * FROM comment WHERE comment_id = ?', [id]);
  
      if (categoryRows.length === 0) {
        return res.status(404).send('Comment tidak ditemukan.');
      }
  
      await db.query('DELETE FROM comment WHERE comment_id = ?', [id]);
  
      res.redirect('/dashboard/comment');
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat menghapus data.');
    }
  }
  
}
export default DashboardCommentController;
