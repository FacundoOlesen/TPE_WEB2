<?php 
require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class CategoriesView {
    private $smarty;

    public function __construct() {
        $this->smarty = new Smarty(); // inicializo Smarty
    }

    public function showTableCategories($categories) {
        $this->smarty->assign('categories', $categories); 
        $this->smarty->display('categoriestable.tpl');
    }
    
    public function editCategorie ($category) {
        $this->smarty->assign('category', $category); 
        $this->smarty->display('editcategorie.tpl');
    }

    public function showError ($category, $error) {
        if ($error ==2) {
            $this->smarty->assign('error', $error); 
            $this->smarty->assign('category', $category); 
            $this->smarty->display('error.tpl');
        }
        if ($error == 3) {
            $this->smarty->assign('error', $error); 
            $this->smarty->assign('category', $category); 
            $this->smarty->display('error.tpl');
        }

        }
}