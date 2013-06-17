$ ->
	ua      = window.navigator.userAgent.toLowerCase();
	IPHONE  = ua.indexOf('iphone') > -1
	IPAD    = ua.indexOf( 'ipad' ) > -1
	ANDROID = ua.indexOf('android') > -1
	if (IPHONE || IPAD || ANDROID)
		stageSizeManager.init()
	return