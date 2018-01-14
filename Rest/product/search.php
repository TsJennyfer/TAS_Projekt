<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/product.php';
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object

 
// get keywords
$keywords=isset($_GET["s"]) ? $_GET["s"] : "";
 
$ksiazki = new Product($db);
 

$stmt = $ksiazki->search($keywords);
$num = $stmt->rowCount();
 
 
 
// check if more than 0 record found
if($num>0){
 
    
    $ksiazki_arr=array();
    $ksiazki_arr["records"]=array();
 
    
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        
        extract($row);
 
        $ksiazki_item=array(
            "id" => $id,
            "tytul" => $Tytul,
            "autor" => $Autor,
            "rokwydania" => $RokWydania,
            "gatunek" => $Gatunek,
            "opis" => $Opis,
			"cena"=>number_format((float)$Cena, 2, '.', ''),
			"promocja" => $Promocja,
			"okladka"=>$Okladka
        );
 
        array_push($ksiazki_arr["records"], $ksiazki_item);
    }
 
    echo json_encode($ksiazki_arr);
}
 
else{
    echo json_encode(
        array("message" => "No products found.")
    );
}
?>