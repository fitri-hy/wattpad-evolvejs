import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const getCSSMiddleware = () => {
  return (req, res, next) => {
    const configPath = path.join(__dirname, '../views/css.json');
    let config;

    try {
      config = JSON.parse(fs.readFileSync(configPath, 'utf8'));
    } catch (error) {
      config = { cssFramework: 'tailwind', cssSource: 'cdn' };
    }

    if (config.cssFramework === 'bootstrap') {
      res.locals.cssFile = config.cssSource === 'cdn'
        ? '<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">'
        : '<link href="/bootstrap-5.3.3/css/bootstrap.min.css" rel="stylesheet">';
    } else if (config.cssFramework === 'tailwind') {
      res.locals.cssFile = config.cssSource === 'cdn'
        ? '<script src="https://cdn.tailwindcss.com"></script>'
        : '<link href="/tailwind-3.4.10/css/tailwind.min.css" rel="stylesheet">';
    }

    next();
  };
};

export default getCSSMiddleware;
