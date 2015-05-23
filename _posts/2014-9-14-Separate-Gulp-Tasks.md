---
layout: post
title: "Separate gulp.js tasks into multiple files"
excerpt: "I have came across JavaScript projects with great structure by which I mean that were modularized neatly whether it was by using browserify, AMD or immediately invoked functions. Some of those projects used gulp.js and I was surprised to see that, in some cases, they let the `gulpfile.js` file grow and put everything in the same file. "
tags: [web development, practice, clean code, gulp]
comments: true
share: true
---
I have came across JavaScript projects with great structure by which I mean that were modularized neatly whether it was by using browserify, AMD or immediately invoked functions. Some of those projects used gulp.js and I was surprised to see that, in some cases, they let the `gulpfile.js` file grow and put everything in the same file. Your gulp.js tasks are represented by code and there is no reason to write your tasks in one single file (unless you have not that many tasks of course). I believe that the quality of your build system should reflect the quality of your code.

Let us make a way from having a single `gulpfile.js` with the entire content of your build system in it to this structure:

    gulpfile.js
    gulp-tasks/
        environments/
            dev.js
            prod.js
            test.js
        browserify.js
        configuration.js
        jshint.js
        test.js
        uglify.js
        vendor.js
        watch.js

A lot of files, yes, but it make everything more clear.

Your `gulpfile.js` will have two lines:

    var requireDir = require('require-dir');

    requireDir('gulp-tasks', { recurse: true });

You probably noticed the use of the `require-dir` module which you need to install by executing the command:

    npm install require-dir --save-dev

The `require-dir` module is a Node helper to require directories recursively (if needed, which we do in the example above).

Every task you will add will now automatically be included in your build system. For example, the `gulp-tasks/jshint.js` could look like this:

    var gulp = require('gulp');
    var jshint = require('gulp-jshint');

    gulp.task('jshint', function(){
        gulp.src('./src/**/*.js')
            .pipe(jshint())
            .pipe(jshint.reporter('jshint-stylish'));
    });

All your other tasks will have similar content and length.

You probably also noticed the `environments` folder. Those files are optional and to your discretion, but I like to have a clear idea of my tasks' execution context. Files in that folder will be two liners too. A the `dev.js` file could be as simple as:

    var gulp = require('gulp');

    gulp.task('dev', ['jshint', 'vendor', 'browserify', 'watch']);

Finally, there are good chances that you will have configuration items, such as paths and patterns of paths for different purposes. You could write them in the individual tasks files, but it might be more useful and clean to have a `configuration.js` file to keep everything at the same place.

Here is an example of a very simple configuration file:

    module.exports = {
        paths: {
            source: 'src',
            release: 'dist'
        },
        specs: {
            specs/**/*/.js,
            ignore: [
                'specs/init.js',
                'specs/runner.js'
            ]
    }

You can then use your configurations in your tasks by adding at the top of your files:

    var configuration = require('./configuration);

This will centralize your configuration values and limit breaking changes when you rename file and move folders around. Those values are yours, represented by javascript literals and you can design them however you want.
