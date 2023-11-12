<?php

require_once 'app/models/categories.model.php';
require_once 'app/views/categories.view.php';
require_once 'app/models/products.model.php';
require_once 'app/helpers/auth.helper.php';

class CategoriesController {
    private $model;
    private $view;
    private $helper;
    private $modelProducts;

    public  function __construct() {

        $this->model = new CategoriesModel();
        $this->view = new CategoriesView();
        $this->modelProducts = new ProductsModel();
        $this->helper = new AuthHelper();
    }


    public   function showAllCategories() {
        $this->helper->IsLoged();
        $categories = $this->model->getAllCategories();
        $this->view->showTableCategories($categories);
    }


    public   function addCategory()  {
        $this->helper->checkloggedIn();
        $category = $_POST['category'];
        if (isset($category) && !empty($category)) {
            $id = $this->model->insertCategory($category);
            header("Location: " . BASE_URL . "categories");
        } else {
            $error = 2;
            $this->view->showError($category, $error);
            die();
        }
    }


    public   function updateCategory($id)  {
        $this->helper->checkloggedIn();


        $category = $this->model->getCategoriesById($id);
        $this->view->editCategorie($category);
        if (empty($_POST['category'])) {
            /*$this->view->showError2($category);*/
            die();
        } else {
            $this->model->modifyCategory($_POST['category'], $id);
            header("Location: " . BASE_URL . "categories");
        }
    }

    public  function deleteCategory($id) {
        $this->helper->checkloggedIn();
        $categories = $this->model->getCategoriesById($id);
        try {
            $this->model->deleteCategorytById($id);
            header("Location: " . BASE_URL . "categories");
        } catch (Exception $e) {
            $error = 3;
            $this->view->showError($categories, $error);
            die();
        }
    }
}
