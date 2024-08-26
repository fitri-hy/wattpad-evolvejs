class LoginController {
  static index(req, res) {
    res.render('dashboard/login', { message: 'Hello from LoginController!' });
  }
}

export default LoginController;
