KeyHider.Views.RepoDashboard = Backbone.View.extend({
  template: JST['repos/dashboard'],

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },
});
