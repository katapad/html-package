###
Gruntfile.coffee
@author naoiwata
###

module.exports = (grunt) ->
	name = 'tmp'
	_csscompile = {}
	_cssminified = {}
	_jscompile = {}
	_jsminified = {}

	jade =
		'debug/index.html': 'debug/view/index.jade'

	_csscompile['debug/css/#{name}.css'] = 'src/stylus/blocks.styl'
	_cssminified['deploy/css/#{name}.min.css'] = 'debug/css/#{name}.css'

	_jscompile['debug/js/#{name}.js'] = 'src/coffee/**/*.coffee'
	_jsminified['deploy/js/#{name}.min.js'] = ['debug/js/#{name}.js']

	grunt.initConfig 
		pkg: grunt.file.readJSON 'package.json'
		jade: 
			compile:
				files: jade
				options:
					pretty: truegit
					data:
						projectName: name
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
			javascript:
				files: _jsminified
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
		'grunt-contrib-jade'
		'grunt-contrib-stylus'
		'grunt-contrib-coffee'
		'grunt-contrib-uglify'
		'grunt-contrib-watch'
		'grunt-contrib-cssmin'
	].forEach (plugin)->
		grunt.loadNpmTasks(plugin)

	grunt.registerTask 'default', ['jade', 'stylus', 'coffee']
	grunt.registerTask 'deploy', ['jade', 'stylus', 'coffee', 'cssmin', 'uglify']

# END	