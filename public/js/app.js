main = function() {
  App = Ember.Application.create();

  App.Router.map(function() {
    // put your routes here
  });

  App.IndexRoute = Ember.Route.extend({
    model: function() {
      return ['red', 'yellow', 'blue', "BLAH"];
    }
  });

  App.IndexController = Ember.Controller.extend({
    login: function() {
      window.open("https://www.facebook.com/dialog/oauth?client_id=1399123866999297&redirect_uri=https://localhost/#login", "Login", "height=200,width=150");
    }
  });
};

localStorage.setItem("token", "blah");
window.addEventListener("storage", function(e) {
  alert(1);
});

if (window.location.hash == "#_=_") {
  localStorage.setItem("token", "11111");
  window.close();
} else {
  main();
}
