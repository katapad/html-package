###
Gruntfile.coffee
@author naoiwata
###

module.exports = (grunt) ->
	name = 'tmp'
	_csscompile = {}
	_jscompile = {}
	_jsMinified = {}

	jade =
		'debug/index.html': 'debug/view/index.jade'

	_csscompile["debug/css/#{name}.min.css"] = 'src/stylus/blocks.styl'
	_csscompile["deploy/css/#{name}.min.css"] = 'src/stylus/blocks.styl'

	_jscompile["debug/js/#{name}.js"] = 'src/coffee/**/*.coffee'
	_jsMinified["deploy/js/#{name}.min.js"] = ["debug/js/#{name}.js"]

	grunt.initConfig 
		pkg: grunt.file.readJSON 'package.json'
		jade: 
			compile:
				files: jade
				options:
					pretty: true
					data:
						projectName: name
		stylus:
			compile:
				files: _csscompile
		coffee:
			compile:
				files: _jscompile
		uglify:
			javascript:
				files: _jsMinified
		watch:
			jade:
				files: 'src/view/**/*.jade'
				tasks: 'jade'
			stylus:
				files: 'src/stylus/**/*.stylus'
				tasks: 'stylus'
			coffee:
				files: 'src/coffee/**/*.coffee'
				tasks: 'coffee uglify'

	plugins = [
		"grunt-contrib-jade"
		"grunt-contrib-stylus"
		"grunt-contrib-coffee"
		"grunt-contrib-uglify"
		"grunt-contrib-watch"
		"grunt-contrib-cssmin"
	].forEach (plugin)->
		grunt.loadNpmTasks(plugin)

	grunt.registerTask 'default', ['jade', 'stylus', 'coffee']
	grunt.registerTask 'deploy', ['jade', 'stylus', 'coffee', 'uglify']

# END	