<?php
include 'app/controllers/products.controller.php';
include 'app/controllers/categories.controller.php';
require_once 'app/controllers/auth.controller.php';



define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER[37221] . dirname($_SERVER['PHP_SELF']) . '/');


$action = 'home';
if (!empty($_GET['action'])) {
    $action = $_GET['action'];
}


$params = explode('/', $action);
$productscontroller = new ProductsController();
$categoriescontroller = new CategoriesController();
$authController = new AuthController();


switch ($params[0]) {
    case 'login':
        $authController->showLogin();
        break;
    case 'validate':
        $authController->validateUser();
        break;
    case 'logout':
        $authController->logout();
        break;
    case 'home':
        $productscontroller->showHome();
        break;
    case 'products':
        $productscontroller->showProducts();
        break;
    case 'insertproduct':
        $productscontroller->addProduct();
        break;
    case 'delete':
        $id = $params[1];
        $productscontroller->deleteProduct($id);
        break;
    case 'modifyproduct':
        $id = $params[1];
        $productscontroller->updateProduct($id);
        break;
    case 'details':
        $id = $params[1];
        $productscontroller->showDetails($id);
        break;
    case 'category':
        $id = $params[1];
        $productscontroller->showProductsByCategory($id);
        break;
    case 'categories':
        $categoriescontroller->showAllCategories();
        break;
    case 'insertcategorie':
        $categoriescontroller->addCategory();
        break;
    case 'modifycategorie':
        $id = $params[1];
        $categoriescontroller->updateCategory($id);
        break;
    case 'deletecategorie':
        $id = $params[1];
        $categoriescontroller->deleteCategory($id);
        break;
    default:
        header('HTTP/1.0 404 Not Found');
        echo "404 not found";
        break;
}
