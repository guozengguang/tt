app.service('detailService',function($http){
    this.findById = function (id) {
        return $http.get('/article/findById?id='+id);
    }
})