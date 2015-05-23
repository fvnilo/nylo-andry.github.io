---
layout: post
title: "What are web components."
excerpt: "I have came across JavaScript projects with great structure by which I mean that were modularized neatly whether it was by using browserify, AMD or immediately invoked functions. Some of those projects used gulp.js and I was surprised to see that, in some cases, they let the `gulpfile.js` file grow and put everything in the same file. "
tags: [web development, web components, polymer]
comments: true
share: true
---

Web components regroups four specs:

1. Custom elements
2. Shadow DOM
3. Template
4. HTML Import

It is still in development and not a lot of browser supports all the specs above (at the time this article is written, only Chrome and Opera supports all four specs).

## Custom elements
Perhaps it is the easiest spec to understand since a few libraries and framework already implement it. Angular and KnockoutJS are the two that come to my mind. In short, it lets developers define their own HTML elements. For example, imagine being able to render a Google map element just by using `<google-map latitude="19.8667" longitude="47.0333"></google-map>` without all the fuss of adding a native HTML element, giving it a class and manipulate it with javascript each time you want a map.

## Shadow DOM
Shadow DOM adresses the problem of encapsulation of the DOM trees. When creating a shadow root, it **separates your content and presentation** and it "hides your implementation". The boundaries of CSS selectors and javascript is then properly defined and doesn't affect anything outside the shadow root and the style inside the shadow root is also not impacted by the outside world.

## Template
A template in the context of web components consists of declaring DOM inside your file that isn't rendered but is used to instantiate portions of your page. It used to be done with script tags that were given a special type such as "text/x-handlebars" for example. The issue with that approach is that the content of your template is text that is parsed to HTML which can be a slow process depending on the size of your template or the number of templates you are loading at the same time. The `<template></template>` tag is already DOM that is manipulated and doesn't need to be parsed.

## HTML Import
It describes the possibility of importing HTML file inside other HTML files and reuse their content.

Shortly, I will have some slides and some code to demonstrate how web components behaves.
