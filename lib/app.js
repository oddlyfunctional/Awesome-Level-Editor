// Generated by CoffeeScript 1.3.3
(function() {

  jQuery(function() {
    var placeholder, template;
    new ALE(800, 600);
    window.player = new ALE.Sprite(jQuery("#teste")[0], {
      x: 200,
      y: 200,
      rows: 2,
      columns: 5
    });
    player.load(function() {
      var i, _i, _ref, _results;
      return player.add("run", (function() {
        _results = [];
        for (var _i = _ref = (function() {
        var _i, _len, _ref1, _results;
        _ref1 = 0;
        _results = [];
        for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
          i = _ref1[_i];
          _results.push(i);
        }
        return _results;
      })(); _ref <= 9 ? _i <= 9 : _i >= 9; _ref <= 9 ? _i++ : _i--){ _results.push(_i); }
        return _results;
      }).apply(this), 21);
    });
    template = new ALE.Template(player);
    template.setDefaultAnimation("run");
    placeholder = template.getPlaceholder();
    return jQuery(".templates").append(placeholder);
  });

}).call(this);
