var formApp = angular.module('formApp', []);
function formController($scope, $http) {
  console.log("in controller");
  
  // blank object to hold form data
  $scope.formData = {};
  

  // function to process data
  $scope.processForm = function() {
    console.log("in form process");
    console.log($.param($scope.formData));
    $http({
      method: 'POST',
      url: '/create', //+ $scope.formData.name, // defaults to create method of controller
      data: {
        name: $scope.formData.name
      }
      //data: $.param($scope.formData), // data passed in as strings,
      //headers: { 'Content-Type': 'application/x-www-form-urlencoded' } // set headers so Angular passes info as form data not request payload
    })
    .success(function(data) {
      //console.log(data);

      if(!data.success) {
        // if not success, bind data to error vars
        $scope.errorName = data.errors;
        //console.log(data);
      } else {
        // if success, bind success message
        $scope.message = data.message;
      }

    });
  };
  
} // end formController