import db from '../core/Database.js';
import fs from 'fs';
import path from 'path';

class DashboardSettingsController {

  static async index(req, res) {
    try {
      const [settingsRows] = await db.query('SELECT * FROM settings WHERE id = 1');

      if (settingsRows.length === 0) {
        return res.status(404).send('Settings tidak ditemukan.');
      }

	  const siteTitle = `Settings | ${settingsRows[0].site_title}`;

      res.render('dashboard/settings', {
		settings: settingsRows[0],
		title: siteTitle
      });
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat mengambil data.');
    }
  }
  
  static async editProcess(req, res) {
    const { site_title, site_tagline, site_desc, site_keyword, oldImageLogo, oldImageFavicon, oldImageOg } = req.body;
    const { id } = req.params;

    try {
      let site_logo = oldImageLogo;
      let site_favicon = oldImageFavicon;
      let site_og = oldImageOg;

      if (req.files) {
        const { site_logo: logoFiles, site_favicon: faviconFiles, site_og: ogFiles } = req.files;

        if (logoFiles && logoFiles.length > 0) {
          const oldLogoPath = path.resolve('public/assets/img', oldImageLogo);
          if (fs.existsSync(oldLogoPath)) {
            try {
              fs.unlinkSync(oldLogoPath);
            } catch (err) {
              console.error(`Failed to delete old logo file: ${err.message}`);
            }
          }
          site_logo = logoFiles[0].filename;
        }
        if (faviconFiles && faviconFiles.length > 0) {
          const oldFaviconPath = path.resolve('public/assets/img', oldImageFavicon);
          if (fs.existsSync(oldFaviconPath)) {
            try {
              fs.unlinkSync(oldFaviconPath);
            } catch (err) {
              console.error(`Failed to delete old favicon file: ${err.message}`);
            }
          }
          site_favicon = faviconFiles[0].filename;
        }
        if (ogFiles && ogFiles.length > 0) {
          const oldOgPath = path.resolve('public/assets/img', oldImageOg);
          if (fs.existsSync(oldOgPath)) {
            try {
              fs.unlinkSync(oldOgPath);
            } catch (err) {
              console.error(`Failed to delete old OG file: ${err.message}`);
            }
          }
          site_og = ogFiles[0].filename;
        }
      }

      await db.query('UPDATE settings SET site_title = ?, site_tagline = ?, site_desc = ?, site_keyword = ?, site_logo = ?, site_favicon = ?, site_og = ? WHERE id = ?', 
        [site_title, site_tagline, site_desc, site_keyword, site_logo, site_favicon, site_og, id]);

      res.redirect('/dashboard/settings');
    } catch (error) {
      console.error(error);
      res.status(500).send('Terjadi kesalahan saat menyimpan data.');
    }
  }
  
}

export default DashboardSettingsController;
