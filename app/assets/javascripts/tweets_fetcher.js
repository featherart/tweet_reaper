$(function() {
  // declare a module
  var myAppModule = angular.module('tweetReaper', []);
   
  // configure the module.
  // in this example we will create a greeting filter
  myAppModule.filter('greet', function() {
   return function(name) {
      return 'Hello, ' + name + '!';
    };
  });

});
