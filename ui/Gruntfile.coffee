module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    clean:
      build: [
        'build',
        'public'
      ]
    coffee:
      options:
        bare: true
      glob_to_multiple:
        expand: true
        cwd: 'app/js/'
        src: ['**/*.coffee']
        dest: 'build/js/'
        ext: '.js'
    emberTemplates:
      compile:
        options:
          templateBasePath: 'app/js/'
        files:
          'build/js/templates.js': '**/*.handlebars'
    copy:
      build:
        files: [
          cwd: 'app/'
          src: ['index.html', 'css/**']
          expand: true
          dest: 'public/'
        ,
          cwd: 'app/'
          src: ['js/**']
          expand: true
          dest: 'build/'
        ,
          src: ['bower_components/**']
          expand: true
          dest: 'build/'
        ]
    neuter:
      options:
        template: '{%= src %}'
        basePath: 'build/'
      application:
        src: 'build/js/app.js'
        dest: 'public/js/app.js'
    watch:
      scripts:
        files: ['app/js/**']
        tasks: ['coffee', 'emberTemplates', 'copy:build', 'neuter']
      other:
        files: ['app/index.html', 'app/css/**']
        tasks: ['copy:build']



  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-ember-templates'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-neuter'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask('default', ['clean', 'coffee', 'emberTemplates', 'copy:build', 'neuter'])
  grunt.registerTask('runw', ['default', 'watch'])