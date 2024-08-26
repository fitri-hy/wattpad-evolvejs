class DashboardController {
  static index(req, res) {
    res.render('dashboard/index', { message: 'Hello from DashboardController!' });
  }
}

export default DashboardController;
