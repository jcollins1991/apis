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
      application:
        src: 'build/js/app.js'
        dest: 'public/js/app.js'
    watch:
      scripts:
        files: ['app/js/**']
        tasks: ['copy:build', 'neuter']
      other:
        files: ['app/index.html', 'app/css/**']
        tasks: ['copy:build']



  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-neuter'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask('default', ['clean', 'coffee', 'copy:build', 'neuter']);
  grunt.registerTask('runw', ['default', 'watch'])