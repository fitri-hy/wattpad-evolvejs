import express from 'express';

class Router {
  constructor() {
    this.router = express.Router();
  }

  addRoute(method, path, handler) {
    this.router[method](path, handler);
    return this;
  }

  getRouter() {
    return this.router;
  }
}

export default Router;
