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