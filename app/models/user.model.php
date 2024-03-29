<?php

class UserModel {

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=clothes_db;charset=utf8', 'root', '');
    }

    public function getUserByEmail($email) {
        $query = $this->db->prepare("SELECT * FROM users WHERE email = ?");
        $query->execute([$email]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

}
