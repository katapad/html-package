###
@author naoiwata
###

$ ->
  ua      = window.navigator.userAgent.toLowerCase();
  IPHONE  = ua.indexOf('iphone') > -1
  IPAD    = ua.indexOf( 'ipad' ) > -1
  ANDROID = ua.indexOf('android') > -1
  if (IPHONE || ANDROID)
    stageSizeManager.init()
  return

# END