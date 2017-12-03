<?php
class Product{
 
    // database connection and table name
    private $conn;
    private $table_name = "ksiazki";
 
    // object properties
    public $id=null;
    public $Tytul=null;
    public $Autor=null;
    public $RokWydania=null;
    public $Gatunek=null;
    public $Opis=null;
    public $Cena=null;
	public $Promocja=null;
	public $s=null;
	
 
    //
    public function __construct($db){
        $this->conn = $db;
    }
	
	function read(){
 
    
    $query = "SELECT
                p.id, p.Tytul, p.Autor, p.RokWydania, p.Gatunek, p.Opis, p.Cena, p.Promocja
            FROM
                " . $this->table_name . " p
                
            ORDER BY
                p.cena DESC";
 
    
    $stmt = $this->conn->prepare($query);
 
    
    $stmt->execute();
 
    return $stmt;
	}
	// create product
function create(){
 
    // query to insert record
    $query = "INSERT INTO
                " . $this->table_name . "
            SET
                Tytul=:Tytul, Cena=:Cena, Opis=:Opis, Gatunek=:Gatunek, RokWydania=:RokWydania, Promocja=:Promocja,Autor=:Autor";
 
    // prepare query
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->Tytul=htmlspecialchars(strip_tags($this->Tytul));
    $this->Cena=htmlspecialchars(strip_tags($this->Cena));
    $this->Opis=htmlspecialchars(strip_tags($this->Opis));
    $this->Gatunek=htmlspecialchars(strip_tags($this->Gatunek));
    $this->Promocja=htmlspecialchars(strip_tags($this->Promocja));
	$this->RokWydania=htmlspecialchars(strip_tags($this->RokWydania));
	$this->Autor=htmlspecialchars(strip_tags($this->Autor));
 
    // bind values
    $stmt->bindParam(":Tytul", $this->Tytul);
    $stmt->bindParam(":Cena", $this->Cena);
    $stmt->bindParam(":Opis", $this->Opis);
    $stmt->bindParam(":Gatunek", $this->Gatunek);
    $stmt->bindParam(":Promocja", $this->Promocja);
	$stmt->bindParam(":RokWydania", $this->RokWydania);
	$stmt->bindParam(":Autor", $this->Autor);
	
	
 
    // execute query
    if($stmt->execute()){
        return true;
    }else{
        return false;
    }
}

function update(){
 
    // update query
    $query = "UPDATE
                " . $this->table_name . "
            SET
                Tytul=:Tytul, Cena=:Cena, Opis=:Opis, Gatunek=:Gatunek, RokWydania=:RokWydania, Promocja=:Promocja,Autor=:Autor
				
            WHERE
                id = :id";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
   $this->Tytul=htmlspecialchars(strip_tags($this->Tytul));
    $this->Cena=htmlspecialchars(strip_tags($this->Cena));
    $this->Opis=htmlspecialchars(strip_tags($this->Opis));
    $this->Gatunek=htmlspecialchars(strip_tags($this->Gatunek));
    $this->Promocja=htmlspecialchars(strip_tags($this->Promocja));
	$this->RokWydania=htmlspecialchars(strip_tags($this->RokWydania));
	$this->Autor=htmlspecialchars(strip_tags($this->Autor));
 
    // bind values
    $stmt->bindParam(":Tytul", $this->Tytul);
    $stmt->bindParam(":Cena", $this->Cena);
    $stmt->bindParam(":Opis", $this->Opis);
    $stmt->bindParam(":Gatunek", $this->Gatunek);
    $stmt->bindParam(":Promocja", $this->Promocja);
	$stmt->bindParam(":RokWydania", $this->RokWydania);
	$stmt->bindParam(":Autor", $this->Autor);
 
    // execute the query
    if($stmt->execute()){
        return true;
    }else{
        return false;
    }
}
	// used when filling up the update product form
function readOne(){
 
    // query to read single record
    $query = $query = "SELECT
                p.id, p.Tytul, p.Autor, p.RokWydania, p.Gatunek, p.Opis, p.Cena, p.Promocja
            FROM
                " . $this->table_name . " p
            WHERE
                p.id = ?
            LIMIT
                0,1";
 
    // prepare query statement
    $stmt = $this->conn->prepare( $query );
 
    // bind id of product to be updated
    $stmt->bindParam(1, $this->id);
 
    // execute query
    $stmt->execute();
 
    // get retrieved row
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
    // set values to object properties
    $this->Tytul = $row['Tytul'];
    $this->Cena = $row['Cena'];
    $this->Opis = $row['Opis'];
    $this->Gatunek = $row['Gatunek'];
    $this->Autor = $row['Autor'];
	$this->Promocja = $row['Promocja'];
	$this->RokWydania = $row['RokWydania'];
	
}
// search products
function search($keywords){
 
    // select all query
    $query = "SELECT
               p.id, p.Tytul, p.Autor, p.RokWydania, p.Gatunek, p.Opis, p.Cena, p.Promocja
            FROM
                " . $this->table_name . " p
            WHERE
                p.Tytul LIKE ? OR p.Gatunek LIKE ? OR p.Autor LIKE ?
            ORDER BY
                p.cena DESC";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $keywords=htmlspecialchars(strip_tags($keywords));
    $keywords = "%{$keywords}%";
 
    // bind
    $stmt->bindParam(1, $keywords);
    $stmt->bindParam(2, $keywords);
    $stmt->bindParam(3, $keywords);
 
    // execute query
    $stmt->execute();
 
    return $stmt;
}
	// delete the product
function delete(){
 
    // delete query
    $query = "DELETE FROM " . $this->table_name . " WHERE id = ?";
 
    // prepare query
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->id=htmlspecialchars(strip_tags($this->id));
 
    // bind id of record to delete
    $stmt->bindParam(1, $this->id);
 
    // execute query
    if($stmt->execute()){
        return true;
    }
 
    return false;
     
}
}
