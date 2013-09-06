### -----------------------------------
 * @author naoiwata
 * javascript for StageSizeManager
----------------------------------- ###

class StageSizeManager

  constructor: (@name) ->
    @max_width     = 640
    @device_width  = null
    @device_height = null
    @window_width  = window.innerWidth
    @window_height = window.innerHeight

  init: (domId, given_width) ->
    setTimeout =>
      @device_width  = screen.width
      @device_height = screen.height
      @setWindowRatio(domId, given_width) 
      window.scrollTo(0, 1)
      return
    , 1000
    return

  setWindowRatio: (domId, given_width) ->
    ua      = window.navigator.userAgent.toLowerCase()
    iphone  = ua.indexOf('iphone')  > -1
    ipad    = ua.indexOf( 'ipad' )  > -1
    ipod    = ua.indexOf( 'ipod' )  > -1
    android = ua.indexOf('android') > -1
    body    = document.body

    if iphone || ipad || ipod || android
      $('html').addClass("sp") if $
      if @device_width > @device_height
        @window_width = @device_height
      else
        @window_width = @device_width
    else 
      $('html').addClass("pc") if $
      @window_width = @max_width

    ratio = @window_width / given_width
    dom = document.getElementById(domId)
    dom.style.zoom   = ratio
    dom.style.margin = '0 auto'
    return

window.stageSizeManager = new StageSizeManager()

# END