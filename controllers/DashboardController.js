import db from '../core/Database.js';

class DashboardController {
  static async index(req, res) {
    try {
      const [settingsRows] = await db.query('SELECT * FROM settings WHERE id = 1');

      if (settingsRows.length === 0) {
        return res.status(404).send('Dashboard tidak ditemukan.');
      }

	  const siteTitle = `${settingsRows[0].site_title} | ${settingsRows[0].site_tagline}`;
      res.render('dashboard/index', {
		title: settingsRows[0].site_title,
		title: siteTitle, settings: settingsRows[0]
      });
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat mengambil data.');
    }
  }
}

export default DashboardController;
