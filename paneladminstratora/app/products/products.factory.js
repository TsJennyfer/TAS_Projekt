app.factory("productsFactory", function($http){
 
    var factory = {};
 
    // read all products
    factory.readProducts = function(){
        return $http({
            method: 'GET',
            url: 'http://localhost:8080/dtas/product/read.php'
        });
    };
     
    // create product
factory.createProduct = function($scope){
    return $http({
        method: 'POST',
        data: {
            'id' : $scope.id,
			'Tytul' : $scope.Tytul,
            'Autor' : $scope.Autor,
            'RokWydania' : $scope.RokWydania,
            'Gatunek' : $scope.Gatunek,
			'Opis' : $scope.Opis,
			'Cena' : $scope.Cena,
			'Promocja' : $scope.Promocja,
			'Okladka' : $scope.Okladka
			
        },
        url: 'http://localhost:8080/dtas/product/create.php'
    });
};
// read one product
factory.readOneProduct = function(id){
    return $http({
        method: 'GET',
        url: 'http://localhost:8080/dtas/product/read_one.php?id=' + id
    });
};
// update product

factory.updateProduct = function($scope){
 
    return $http({
        method: 'POST',
        data: {
            'id' : $scope.id,
			'Tytul' : $scope.Tytul,
            'Autor' : $scope.Autor,
            'RokWydania' : $scope.RokWydania,
            'Gatunek' : $scope.Gatunek,
			'Opis' : $scope.Opis,
			'Cena' : $scope.Cena,
			'Promocja' : $scope.Promocja,
			'Okladka' : $scope.Okladka
        },
        url: 'http://localhost:8080/dtas/product/update.php'
    });
};


 
// delete product
factory.deleteProduct = function(id){
    return $http({
        method: 'POST',
        data: { 'id' : id },
        url: 'http://localhost:8080/dtas/product/delete.php'
    });
};
     
    return factory;
});