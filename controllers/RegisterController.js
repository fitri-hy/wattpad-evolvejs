class RegisterController {
  static index(req, res) {
    res.render('dashboard/register', { message: 'Hello from RegisterController!' });
  }
}

export default RegisterController;
