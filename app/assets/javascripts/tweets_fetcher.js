var formApp = angular.module('formApp', []);
function formController($scope, $http) {
  console.log("in controller");
  
  // blank object to hold form data
  $scope.formData = {};

  // function to process data
  $scope.processForm = function() {

  };
}