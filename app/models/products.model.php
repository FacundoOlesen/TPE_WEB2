<?php

class ProductsModel
{
    private $db;

    public  function __construct() {
        $this->db = $this->connect();
    }

    private function connect()  {
        $db = new PDO('mysql:host=localhost;' . 'dbname=clothes_db;charset=utf8', 'root', '');
        return $db;
    }

    public  function getAllProducts()  {
        $query = $this->db->prepare('SELECT * FROM products');
        $query->execute();

        $products = $query->fetchAll(PDO::FETCH_OBJ);

        return $products;
    }
 

    public  function insertProduct($name, $price, $size, $description, $category, $imagen = null)   {
        $pathImg = null;
        
        if ($imagen) {
            $pathImg = $this->uploadImage($imagen);
            $query = $this->db->prepare('INSERT INTO products (nombre, precio, talle, descripcion, id_categoria_fk, imagen) VALUES (?, ?, ?, ?, ?, ?)');
            $query->execute([$name, $price, $size, $description, $category, $pathImg]);
            return $this->db->lastInsertId();
        }
        else {
            $query = $this->db->prepare('INSERT INTO products (nombre, precio, talle, descripcion, id_categoria_fk) VALUES (?, ?, ?, ?, ?)');
            $query->execute([$name, $price, $size, $description, $category]);
        }
    }

    private function uploadImage($image)  {
        $target = "img/products/" . uniqid() . '.jpg';
        move_uploaded_file($image, $target);
        return $target;
    }


    public function modifyProduct($name, $price, $size, $description, $category, $id) {
        $query = $this->db->prepare('UPDATE products SET nombre=? , precio=?, talle=?, descripcion=?, id_categoria_fk=? WHERE id = ?');
        $query->execute([$name, $price, $size, $description, $category, $id]);
    }

    public  function deleteProductById($id)   {
        $query = $this->db->prepare('DELETE FROM products WHERE id = ?');
        $query->execute([$id]);
    }

    public function filterProductsByCategorie ($id_category) {
        $query = $this->db-> prepare ('SELECT * FROM products WHERE id_categoria_fk= ?');
        $query->execute([$id_category]);
        $productsbycategory = $query->fetchAll(PDO::FETCH_OBJ);
        return $productsbycategory;
    }
    public function getProductsById($id) {
        $query = $this->db->prepare('SELECT * FROM `products` WHERE id = ?');
        $query->execute([$id]);
        $productsbyid = $query->fetch(PDO::FETCH_OBJ);
        return $productsbyid;
    }

}
