### -----------------------------------
 * @author naoiwata
 * javascript for StageSizeManager
----------------------------------- ###

class StageSizeManager

  constructor: (@name) ->
    @max_width     = 640
    @device_width  = screen.width
    @device_height = screen.height
    @window_width  = window.innerWidth
    @window_height = window.innerHeight

  init: (given_width) ->
    setTimeout ->
      window.scrollTo(0, 1)
      return
    , 100

    @setWindowRatio(given_width) 
    return

  setWindowRatio: (given_width) ->
    ua      = window.navigator.userAgent.toLowerCase();
    iphone  = ua.indexOf('iphone')  > -1
    ipad    = ua.indexOf( 'ipad' )  > -1
    android = ua.indexOf('android') > -1
    body    = document.body

    if @device_width > @device_height
      @device_width = @device_height 
      
    if (iphone || ipad || android)
      if @window_width > @window_height
        @window_width = @device_width
      else
        @window_width = @max_width
    else 
      @window_width = @max_width     
    
    if @window_width > @max_width
      @window_width = @max_width

    window.ratio = ratio = @window_width / given_width
    body.style.fontSize = ratio + 'em' 
    # body.style.margin   = '0 auto'
    # body.style.width    = given_width / 10 + 'em'
    console.log "ratio: " + ratio
    return

window.stageSizeManager = new StageSizeManager()

# END