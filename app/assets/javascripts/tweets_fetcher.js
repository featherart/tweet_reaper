function twitUserCtrl($scope) {
  $scope.master = {};

  $scope.update = function(twitterUser) {
    $scope.master = angular.copy(twitterUser);
  };

  $scope.reset = function() {
    $scope.twitterUser = angular.copy($scope.master);
  };

  $scope.reset();
}

function MyController($scope) {
  $scope.username = 'World';
 
  $scope.sayHello = function() {
    $scope.greeting = 'Hello ' + $scope.username + '!';
  };
}