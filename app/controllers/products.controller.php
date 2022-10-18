<?php
require_once 'app/models/products.model.php';
require_once 'app/views/products.view.php';
require_once 'app/models/categories.model.php';
require_once 'app/helpers/auth.helper.php';

class ProductsController
{
    private $model;
    private $view;

    public function __construct(){
        $this->model = new ProductsModel();
        $this->modelCategory = new CategoriesModel();
        $this->view = new ProductsView();
        $this->helper = new AuthHelper();
    }


    public function showHome() {
        $this->helper->IsLoged();
        $this->view->showHome();
    }

    public function showProducts() {
        $this->helper->IsLoged();
        $products = $this->model->getAllProducts();
        $categories = $this->modelCategory->getAllCategories();
        $this->view->showTable($products, $categories);
    }

    public  function showProductsByCategory($id_category)  {
        $this->helper->IsLoged();
        $categories = $this->modelCategory->getAllCategories();
        $productsbycategory = $this->model->filterProductsByCategorie($id_category);
        $this->view->filterProductsCategory($productsbycategory, $categories);
    }

    public  function addProduct()   {
        $this->helper->checkloggedIn();
        $products = $this->model->getAllProducts();
        $category = $this->modelCategory->getAllCategories();
        $name = $_POST['name'];
        $price = $_POST['price'];
        $size = $_POST['size'];
        $description = $_POST['description'];
        $category = $_POST['category'];

        if (empty($name) || empty($price) || empty($size) || empty($description) || empty($category)) {
            $error = 1;
            $this->view->showError($category, $error, $products);
            die();
        }

        if (
            $_FILES['input_name']['type'] == "image/jpg" || $_FILES['input_name']['type'] == "image/jpeg" || $_FILES['input_name']['type'] == "image/png") {
            $this->model->insertProduct($name, $price, $size, $description, $category, $_FILES['input_name']['tmp_name']);
        } 
        
        else if (empty($_FILES['input_name']['tmp_name']) && !empty($name) && !empty($price) && !empty($size) && !empty($description)) {
            $this->model->insertProduct($name, $price, $size, $description, $category);
        }

        header("Location: " . BASE_URL . "products");
    }


    public  function deleteProduct($id) {
        $this->helper->checkloggedIn();
        $this->model->deleteProductById($id);
        header("Location: " . BASE_URL . "products");
    }

    public  function updateProduct($id) {
        error_reporting(E_ALL ^ E_WARNING);
        $this->helper->checkloggedIn();

        $product = $this->model->getProductsById($id);
        $categories = $this->modelCategory->getAllCategories();

        $this->view->editProduct($product, $categories);
        $name = $_POST['editname'];
        $price = $_POST['editprice'];
        $size = $_POST['editsize'];
        $description = $_POST['description'];
        $category = $_POST['category'];

        if (empty($name) && !isset($name) && empty($price) && empty($size)) {
            die();
        } 
        
        else {
            $this->model->modifyProduct($name, $price, $size, $description, $category, $id);
            header("Location: " . BASE_URL . "products");
        }
    }

    public function showDetails($id) {
        $this->helper->IsLoged();
        $products = $this->model->getProductsById($id);
        $this->view->showDetails($products);
    }
}
