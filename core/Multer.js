// multer.js
import multer from 'multer';
import path from 'path';

const storyStorage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'public/assets/img/story/');
  },
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    cb(null, `${Date.now()}${ext}`);
  }
});

const settingsStorage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'public/assets/img/');
  },
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    cb(null, `${Date.now()}${ext}`);
  }
});

const upload = multer({ storage: storyStorage });
const uploadSettings = multer({ storage: settingsStorage });

export { upload, uploadSettings };
