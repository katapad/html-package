module.exports = (grunt) ->
	name = 'scaffold'
	stylus = {}
	javascript = {}
	jsMinified = {}
	# separate templates for all pages
	jade =
		'dist/index.html': 'dist/view/index.jade'
	# styles are compiled to one minified css
	stylus["dist/css/#{name}.min.css"] = 'src/stylus/blocks.styl'
	# logic written with coffee is compiled to one js
	javascript["dist/js/#{name}.js"] = 'src/coffee/**/*.coffee'
	jsMinified["dist/js/#{name}.min.js"] = ["dist/js/#{name}.js"]

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
				files: stylus
		coffee:
			compile:
				files: javascript
		uglify:
			javascript:
				files: jsMinified
		watch:
			jade:
				files: 'src/view/**/*.jade'
				tasks: 'jade'
			stylus:
				files: 'src/stylus/**/*.stylus'
				tasks: 'stylus'
			coffee:
				files: 'coffee/**/*.coffee'
				tasks: 'coffee uglify'

	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-contrib-stylus'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-watch'

	grunt.registerTask 'default', ['jade', 'stylus', 'coffee', 'uglify']