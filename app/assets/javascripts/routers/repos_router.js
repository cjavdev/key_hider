/*global window, KeyHider, Backbone, $ */
KeyHider.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    '': 'index'
  },

  index: function () {
    var repos = new KeyHider.Collections.Repos();
    repos.fetch();

    var view = new KeyHider.Views.RepoDashboard({
      collection: repos
    });

    this._swapView(view);
  },

  _swapView: function (view) {
    this.currentView && this.curentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  },
});
