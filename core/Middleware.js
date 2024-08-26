class Middleware {
  static logRequests(req, res, next) {
    console.log(`[${new Date().toISOString()}] ${req.method} ${req.url}`);
    next();
  }

  static addHeader(req, res, next) {
    res.setHeader('X-Custom-Header', 'MyCustomHeaderValue');
    next();
  }

}

export default Middleware;
