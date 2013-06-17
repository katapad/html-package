###
Gruntfile.coffee
@author naoiwata
###

module.exports = (grunt) ->
	_name        = 'build'
	_csscompile  = {}
	_cssminified = {}
	_jscompile   = {}
	_jsminified  = {}

	_jade =
		'dist/index.html': 'src/view/index.jade'

	_csscompile["dist/css/#{_name}.css"]      = 'src/stylus/layout.styl'
	_cssminified["dist/css/#{_name}.min.css"] = "dist/css/#{_name}.css"

	_jscompile["dist/js/#{_name}.js"]      = "src/coffee/**/*.coffee"
	_jsminified["dist/js/#{_name}.min.js"] = "dist/js/#{_name}.js"

	grunt.initConfig 
		pkg: grunt.file.readJSON 'package.json'
		jade: 
			compile:
				files: _jade
				options:
					pretty: true
					data:
						filename: _name
		stylus:
			compile:
				files: _csscompile
		cssmin:
			compile:
				files: _cssminified
		coffee:
			compile:
				files: _jscompile
		uglify:
			compile:
				files: _jsminified
		watch:
			jade:
				files: 'src/view/**/*.jade'
				tasks: 'jade'
			stylus:
				files: 'src/stylus/**/*.stylus'
				tasks: 'stylus cssmin'
			coffee:
				files: 'src/coffee/**/*.coffee'
				tasks: 'coffee uglify'

	plugins = [
		'grunt-contrib-jade'
		'grunt-contrib-stylus'
		'grunt-contrib-coffee'
		'grunt-contrib-uglify'
		'grunt-contrib-watch'
		'grunt-contrib-cssmin'
	].forEach (plugin) ->
		grunt.loadNpmTasks(plugin)

	grunt.registerTask 'default', ['jade', 'stylus', 'coffee', 'cssmin', 'uglify']

# END	