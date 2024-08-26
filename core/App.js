import express from 'express';
import ejs from 'ejs';
import path from 'path';
import { fileURLToPath } from 'url';
import methodOverride from 'method-override';
import Router from './Router.js';
import Middleware from './Middleware.js';
import getCSSMiddleware from './CSSMiddleware.js';
import WebRoute from '../routes/WebRoute.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

class App {
  constructor() {
    this.app = express();
    this.router = new Router();
    this.setup();
  }

  setup() {
    this.app.use(express.urlencoded({ extended: true }));
    this.app.use(express.json());
	this.app.use(methodOverride('_method'));
    this.app.engine('ejs', ejs.renderFile);
    this.app.set('view engine', 'ejs');
    this.app.set('views', path.join(__dirname, '../views'));
    this.app.use(express.static(path.join(__dirname, '../public')));
    this.app.use(getCSSMiddleware());
    this.app.use(Middleware.logRequests);
    this.app.use(Middleware.addHeader);

    this.app.use('/', WebRoute);
    
    this.app.use(this.router.getRouter());
    this.app.use((req, res, next) => {
      res.status(404).render('pages/404', { title: 'Page Not Found' });
    });
  }

  start(port = 3000) {
    this.app.listen(port, () => {
      console.log(`Server running on port ${port}`);
    });
  }

  use(middleware) {
    this.app.use(middleware);
    return this;
  }

  get(route, handler) {
    this.router.addRoute('get', route, handler);
    return this;
  }

  post(route, handler) {
    this.router.addRoute('post', route, handler);
    return this;
  }
}

export default App;
