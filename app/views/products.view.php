<?php 
require_once './libs/smarty-4.2.1/libs/Smarty.class.php';
class ProductsView {
    private $smarty;

    public function __construct() {
        $this->smarty = new Smarty(); // inicializo Smarty
    }

    public function showHome($products, $categories) {
        $this->smarty->assign('products', $products); 
        $this->smarty->assign('categories', $categories); 
        $this->smarty->display('home.tpl');
    }

    public function showTable($products, $category) {
        $this->smarty->assign('products', $products); 
        $this->smarty->assign('category', $category); 
        $this->smarty->display('productsTable.tpl');
    }

    public  function editProduct ($product, $categories) {
        $this->smarty->assign('product', $product); 
        $this->smarty->assign('categories', $categories); 
        $this->smarty->display('editproduct.tpl');
    }
    
    public  function filterProductsCategory($productsbycategory, $categories) {
        $this->smarty->assign('productsbycategory', $productsbycategory); 
        $this->smarty->assign('categories', $categories);   
        $this->smarty->display('filterbycategory.tpl');
    }

    public function showDetails($products) {
        $this->smarty->assign('products', $products); 
        $this->smarty->display('details.tpl');
    }
    
    public function showError ($category, $error, $products) {
        if ($error == 1) {
            $this->smarty->assign('error', $error); 
            $this->smarty->assign('category', $category);
            $this->smarty->display('error.tpl'); 
        }

        else if ($error ==2) {
            $this->smarty->assign('error', $error); 
            $this->smarty->assign('products', $products); 
            $this->smarty->assign('category', $category);
            $this->smarty->display('error.tpl'); 
        }
        
    }
}