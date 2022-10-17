<?php

class CategoriesModel {
    private $db;

    function __construct() {
        $this->db = $this->connect ();
    }

    private function connect () {
        $db = new PDO ('mysql:host=localhost;'.'dbname=clothes_db;charset=utf8', 'root', '');
        return $db;
    }

    public  function getAllCategories() {
        $query = $this->db-> prepare ('SELECT * FROM categories');
        $query->execute();
        $categories = $query->fetchAll(PDO::FETCH_OBJ);
        return $categories;
    }

    public function getCategoriesById($id) {
        $query = $this->db-> prepare ('SELECT * FROM categories WHERE id_categoria= ?');
        $query->execute([$id]);
        $categoriesbyid = $query->fetch(PDO::FETCH_OBJ);
        return $categoriesbyid;
    }

    public   function insertCategory($name) {
        $query = $this->db->prepare("INSERT INTO categories (nombre_categoria) VALUES (?)");
        $query->execute([$name]);
        return $this->db->lastInsertId();
    }

    public function deleteCategorytById($id) {
        $query = $this->db->prepare('DELETE FROM categories WHERE id_categoria = ?');
        $query->execute([$id]);
    }

    public function modifyCategory($id, $category) {
        $query = $this->db->prepare("UPDATE categories SET nombre_categoria= ?  WHERE id_categoria = ?");
        $query->execute([$id, $category]);
    }
    
    public function filterProductsByCategorie ($id_category) {
        $query = $this->db-> prepare ('SELECT * FROM products WHERE id_categoria_fk= ?');
        $query->execute([$id_category]);
        $productsbycategory = $query->fetchAll(PDO::FETCH_OBJ);
        return $productsbycategory;
    }

}

