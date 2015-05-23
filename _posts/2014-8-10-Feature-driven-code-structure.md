---
layout: post
title: "Feature-driven code structure"
excerpt: "Neat code structure  (or decomposition) is as important as software design and implementation. In a recent project, we had to use an approach that I found weird at first and I had a hard time adapting to it at first."
tags: [development, web, angular]
comments: true
share: true
---
Neat code structure  (or decomposition) is as important as software design and implementation. In a recent project, we had to use an approach that I found weird at first and I had a hard time adapting to it at first. As the project went on, I found that this approach works and has its advantages. You can use this approach I am about to explain in pretty much any situation.

## Feature-driven folder structure and an example ###
The idea is simple, _you organize your code by features or business sub-domains_.

Here is an example: our imaginary application will be a albums and pictures hosting website such as Imgur and Flickr. Yes, this application already exists but I just want to explain the idea.

### The classical approach ###

I will use the Angular.js terminology. This is how I would have organized my code:

    my-project/
        app.js
        style.css
        controllers/
            album-detail-controller.js
            album-list-controller.js
            login-controller.js
            picture-controller.js
            signup-controller.js
        directives/
            picture-directive.js
        filters/
            album-filter.js
        services/
            album-service.js
            login-service.js
            picture-service.js
            signup-service.js
        views/
            album-detail.html
            album-list.html
    		login.html
    		picture.html
            signup.html

Nothing is wrong with this decomposition. It is the classic approach and it works well. But here are the points that brothered me when I separated my code like this:

- Some folders might contain only one file
-  Changing a feature will make you navigate from folders to folders and unless you have some  unit tests (which is not always the case ;-)), you will not know if you changed everything needed to make your new feature working.
- The style.css file will be __HUGE__ in no time and I hate long css files.

### The alternate way ###
Here is an alternate way to separate your code, by features:

    my-project/
        app.js
        components/
            album/
                album.css
                album-filter.js
                album-service.js
            authentication/
                authentication.css
                authentication-service.js
            picture/
                picture-directive.js
                picture-service.js
                picture-template.html
        album-detail/
            album-detail.css
            album-detail.html
            album-detail-controller.js
        album-list/
            album-list.css
            album-list.html
            album-list-controller.js
        login/
            login.html
            login-controller.js
        signup/
            signup.html
            signup-controller.js

This approach was proposed by the Angular.js team but I used something similar in another project in .NET. Directories were separated by features like in this example. Let us study what happened.

- Everything is grouped by features or sub-domains as I like to call them.
- The sign up and login service were merged in one for the authentication.
- The "views" folders is now separated by pages and contains their html file and their controller.
- The single css file is gone and it was separated in multiple files.

### Usage and advantages ###

Perhaps, it is important to say that it is probably __not a good idea to separate your code by features in a smaller project__ as it will only saturate your repository.

Keep in mind, this is an example project using Angular.js but you can use a common approach with the technology of your choice. It is also __not limited to the front-end structure__ and I guarantee you will have a lot of advantages using feature-driven code organization in your back-end code. The main advantage is that __it is more coherent with the business domain__. This is a huge plus in a project especially if you are adding people to your development team as they will find their way much easier to learning the application. It makes it also __easier to speak to the clients__ as you are striving to use their _vocabulary_ and it will keep the conversations you are having with them flowing. Everybody will use the same words, ideas and idioms.
