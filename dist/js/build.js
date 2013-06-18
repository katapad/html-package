/*
@author naoiwata
javascript for StageSizeManager
*/


(function() {
  var StageSizeManager;

  StageSizeManager = (function() {
    function StageSizeManager(name) {
      this.name = name;
      this.MAX_WIDTH = 640;
    }

    StageSizeManager.prototype.init = function() {
      setTimeout(function() {
        return window.scrollTo(0, 1);
      }, 100);
      this.onResize();
      return window.addEventListener('resize', function() {
        return stageSizeManager.onResize();
      });
    };

    StageSizeManager.prototype.onResize = function(e) {
      var BODY, ORIENTATION, WINDOW_HEIGHT, WINDOW_WIDTH;
      BODY = document.body;
      WINDOW_WIDTH = window.innerWidth;
      WINDOW_HEIGHT = window.innerHeight;
      ORIENTATION = window.orientation;
      if (WINDOW_WIDTH > this.MAX_WIDTH) {
        BODY.style.width = this.MAX_WIDTH + 'px';
        return BODY.style.margin = '0 auto';
      } else {
        return BODY.style.zoom = WINDOW_WIDTH / this.MAX_WIDTH;
      }
    };

    return StageSizeManager;

  })();

  window.stageSizeManager = new StageSizeManager();

}).call(this);

/*
@author naoiwata
*/


(function() {
  $(function() {
    var ANDROID, IPAD, IPHONE, ua;
    ua = window.navigator.userAgent.toLowerCase();
    IPHONE = ua.indexOf('iphone') > -1;
    IPAD = ua.indexOf('ipad') > -1;
    ANDROID = ua.indexOf('android') > -1;
    if (IPHONE || ANDROID) {
      stageSizeManager.init();
    }
  });

}).call(this);
