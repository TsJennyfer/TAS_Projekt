<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 

include_once '../config/database.php';
include_once '../objects/product.php';
 

$database = new Database();
$db = $database->getConnection();
 

$ksiazki = new Product($db);
 

$stmt = $ksiazki->read();
$num = $stmt->rowCount();
 

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
            "category_id" => $Gatunek,
            "category_name" => $Opis,
			"cena"=>number_format((float)$Cena, 2, '.', ''),
			"promocja" => $Promocja
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