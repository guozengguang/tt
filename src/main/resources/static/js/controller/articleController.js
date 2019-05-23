app.controller('articleController',function ($scope,$http,$controller,articleService) {
    $controller('baseController',{$scope:$scope});//继承

    //读取列表数据绑定到表单中
    $scope.findAll=function(){
        articleService.findAll().success(
            function(response){
                $scope.list=response.data;


            }
        );
    }
    $scope.findHotArticle = function () {
        articleService.findHotArticle().success(
            function (response) {
                $scope.entity = response.data;
            }
        )
    }
    $scope.updateVisitsup = function (id) {
        articleService.updateVisitsup(id).success(
            function (response) {
                $scope.list = response;
            }
        )
    }
    $scope.findOnline = function () {
        articleService.findOnline().success(
            function (response) {
                alert(response);
                $scope.entity = response;
            }
        )
    }
    $scope.searchArticle = function () {
        var keywords = $scope.keywords;
        articleService.searchArticle(keywords).success(
            function (response) {
                //alert(response.data)
                $scope.list = response.data;
            }
        )
    }
})

