<?php

 class Accounts {

    static public $database;

    static public function set_database($database) {
      self::$database = $database;
    }

    static public function find_by_sql($sql) {
      $stmt = self::$database->query($sql);
      if(!$stmt) {
        exit("database query failed");
      }

      $object_array = [];
      while($record = $stmt->fetch_assoc()) {
        $object_array[] = self::instantiate($record);
      }
      return $stmt;
    }

    static public function find_all() {
      $stmt = self::$database->query("SELECT * FROM accounts");
      return $stmt;
    }

    static protected function instantiate($record) {
      $object = new self;
      foreach($record as $property => $value) {
        if(property_exists($object, $property)) {
          $object->$property = $value;
        }
      }
      return $object;
    }

    public $user_id;
    public $newsletter_id_fk;
    public $user_role_id_fk;
    public $preferred_name;
    public $email;
    public $member_date;
    protected $password;

    public function __construct($args=[]) {
        $this->user_id = $args['user_id'] ?? '';
        $this->newsletter_id_fk = $args['newsletter_id_fk'] ?? '';
        $this->user_role_id_fk = $args['user_role_id_fk'] ?? '';
        $this->preferred_name = $args['preferred_name'] ?? '';
        $this->email = $args['email'] ?? '';
        $this->member_date = $args['member_date'] ?? '';
        $this->password = $args['password'] ?? '';
    }

}