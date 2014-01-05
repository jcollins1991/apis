module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    clean:
      build: [
        'build',
        'public'
      ]
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
        files: [
          cwd: 'build/'
          src: ['**']
          expand: true
          dest: 'public/'
        ]
    neuter:
      application:
        src: 'build/js/app.js'
        dest: 'public/js/app.js'


  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-copy')

  grunt.registerTask('default', ['clean', 'copy:build', 'copy:neuter']);