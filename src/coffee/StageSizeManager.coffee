###
@author naoiwata
javascript for StageSizeManager
###

class StageSizeManager

  constructor: (@name) ->
    @MAX_WIDTH = 640

  init: ->
    setTimeout ->
      window.scrollTo(0, 1)
    , 100

    @onResize()
    window.addEventListener('resize',  -> 
      stageSizeManager.onResize())

  onResize: (e) ->
    BODY          = document.body
    WINDOW_WIDTH  = window.innerWidth
    WINDOW_HEIGHT = window.innerHeight
    ORIENTATION   = window.orientation

    if WINDOW_WIDTH > @MAX_WIDTH
      BODY.style.width  = @MAX_WIDTH + 'px'
      BODY.style.margin = '0 auto'
    else
      BODY.style.zoom = WINDOW_WIDTH / @MAX_WIDTH

window.stageSizeManager = new StageSizeManager()

# END