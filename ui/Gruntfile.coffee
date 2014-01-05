module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    clean:
      build: [
        'build',
        'public'
      ]
    copy:
      main:
        files: [
          cwd: 'app/'
          src: ['**']
          expand: true
          dest: 'public/'
        ,
          src: ['bower_components/**']
          expand: true
          dest: 'public/'
        ]


  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-copy')

  grunt.registerTask('default', ['clean', 'copy']);