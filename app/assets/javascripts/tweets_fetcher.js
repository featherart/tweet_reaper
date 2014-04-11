var formApp = angular.module('formApp', []);
function formController($scope, $http) {
  console.log("in controller");
  
  // blank object to hold form data
  $scope.formData = {};
  

  // function to process data
  $scope.processForm = function() {
    console.log("in form process");
    console.log($.param($scope.formData));
    var attr = {};
    attr.name = $scope.formData.name;
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


    var attr = {};
    attr.symbol = $filter('uppercase')($scope.newSymbol);
    $http({method: 'GET', url: "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20WHERE%20symbol%3D" + "'" + attr.symbol + "'" + "&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
      }).success(function(data, status, headers, config) {
     $scope.error = false;
     attr.name = data.query.results.quote["Name"];
     attr.bid = data.query.results.quote["Bid"];
     attr.ask = data.query.results.quote["Ask"];
     attr.year_low = data.query.results.quote["YearLow"];
     attr.year_high = data.query.results.quote["YearHigh"];
     var newStock = Stock.create(attr);
     $scope.stocks.push(newStock);
     $scope.newSymbol = "";