window.KeyHider = window.App = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var router = new App.Router({
      $rootEl: $('#main')
    });
    Backbone.history.start();
  }
};

