module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-clean')

  grunt.initConfig
    copy:
      web:
        src: '*.html'
        dest: 'build/'
        cwd: 'src/web'
        expand: true

    clean: ['build/']

    watch:
      coffee:
        files: 'src/coffee/*.coffee'
        tasks: ['coffee:compile']
      web:
        files: 'src/web/*'
        tasks: ['copy:web']

    coffee:
      compile:
        expand: true,
        flatten: true,
        options:
          bare: true
        cwd: "#{__dirname}/src/",
        src: ['coffee/*.coffee'],
        dest: 'build/',
        ext: '.js'

  grunt.registerTask("default",["clean","copy","coffee"])