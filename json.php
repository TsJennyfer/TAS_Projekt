<?php
    //open connection to mysql db
    $connection = mysqli_connect("localhost","root","root","api") or die("Error " . mysqli_error($connection)); //3d parametr - password

    $sql = "set names utf8";
    
    $result = mysqli_query($connection, $sql) or die("Error in Selecting " . mysqli_error($connection));
    
    //fetch table rows from mysql db
    
    //TODO(KRISTIAN):
    //dodaj argument NAME do selecta
    //+picture.php dla obrazkow
    
    $sql = "select * from ksiazki";
    
    $result = mysqli_query($connection, $sql) or die("Error in Selecting " . mysqli_error($connection));
    
    //create an array
    $emparray = array();
    while($row =mysqli_fetch_assoc($result))
    {
        $emparray[] = $row;
    }
    echo json_encode(["result"=>"OK", "data"=>$emparray]);

    //close the db connection
    mysqli_close($connection);
?>
