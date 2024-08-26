import App from './core/App.js';
import Middleware from './core/Middleware.js';

const app = new App();

app
  .use(Middleware.logRequests)
  .use(Middleware.addHeader)
  .start(3000);
