import express from 'express';
import upload from '../core/multer.js';
import HomeController from '../controllers/HomeController.js';
import LoginController from '../controllers/LoginController.js';
import RegisterController from '../controllers/RegisterController.js';
import DashboardController from '../controllers/DashboardController.js';
import DashboardStoryController from '../controllers/DashboardStoryController.js';
import DashboardCategoryController from '../controllers/DashboardCategoryController.js';

const router = express.Router();

router.get('/', HomeController.index);
router.get('/story-list', HomeController.storyList);
router.get('/story/:slug', HomeController.storyDetail);

router.get('/login', LoginController.index);
router.get('/register', RegisterController.index);

router.get('/dashboard', DashboardController.index);

router.get('/dashboard/story', DashboardStoryController.index);
router.get('/dashboard/story/create', DashboardStoryController.create);
router.post('/dashboard/story/create', upload.single('image'), DashboardStoryController.createProccess);
router.get('/dashboard/story/edit/:id', DashboardStoryController.edit);
router.post('/dashboard/story/edit/:id', upload.single('image'), DashboardStoryController.updateProcess);
router.post('/dashboard/story/delete/:id', DashboardStoryController.deleteStory);

router.get('/dashboard/category', DashboardCategoryController.index);
router.get('/dashboard/category/create', DashboardCategoryController.create);
router.post('/dashboard/category/create', DashboardCategoryController.createProccess);
router.get('/dashboard/category/edit/:id', DashboardCategoryController.edit);
router.post('/dashboard/category/edit/:id', DashboardCategoryController.updateProcess);
router.post('/dashboard/category/delete/:id', DashboardCategoryController.deleteCategory);

export default router;
