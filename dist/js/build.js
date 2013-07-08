/* -----------------------------------
 * @author naoiwata
 * javascript for StageSizeManager
-----------------------------------
*/


(function() {
  var StageSizeManager;

  StageSizeManager = (function() {
    function StageSizeManager(name) {
      this.name = name;
      this.max_width = 640;
      this.device_width = screen.width;
      this.device_height = screen.height;
      this.window_width = window.innerWidth;
      this.window_height = window.innerHeight;
    }

    StageSizeManager.prototype.init = function(given_width) {
      setTimeout(function() {
        window.scrollTo(0, 1);
      }, 100);
      this.setWindowRatio(given_width);
    };

    StageSizeManager.prototype.setWindowRatio = function(given_width) {
      var android, body, ipad, iphone, ratio, ua;
      ua = window.navigator.userAgent.toLowerCase();
      iphone = ua.indexOf('iphone') > -1;
      ipad = ua.indexOf('ipad') > -1;
      android = ua.indexOf('android') > -1;
      body = document.body;
      if (this.device_width > this.device_height) {
        this.device_width = this.device_height;
      }
      if (iphone || ipad || android) {
        if (this.window_width > this.window_height) {
          this.window_width = this.device_width;
        }
      } else {
        this.window_width = this.max_width;
      }
      if (this.window_width > this.max_width) {
        this.window_width = this.max_width;
      }
      window.ratio = ratio = this.window_width / given_width;
      body.style.fontSize = ratio + 'em';
      body.style.margin = '0 auto';
    };

    return StageSizeManager;

  })();

  window.stageSizeManager = new StageSizeManager();

}).call(this);

/* -----------------------------------
 * @author naoiwata
-----------------------------------
*/


(function() {
  $(function() {
    stageSizeManager.init(480);
  });

}).call(this);
