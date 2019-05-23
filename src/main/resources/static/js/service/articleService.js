app.service('articleService',function($http){
    this.findAll=function(){
        return $http.get('/article');
    }
    this.findHotArticle = function () {
        return $http.get('/article/hostArticle');
    }
    this.updateVisitsup = function (id) {
        return $http.put('/article/visitsup?id='+id);
    }
    this.findOnline = function () {
        return $http.get('/online');
    }

    this.searchArticle = function (keywords) {
        return $http.get('http://localhost:9003/article/search?keywords='+keywords);
    }
});
