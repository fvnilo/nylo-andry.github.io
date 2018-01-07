---
layout: post
title:  "Elm: My first impressions"
date:   2017-03-24 00:00:00 -0500
categories: development, frontend, code
---
<img class="post-header--elm" src="/assets/elm-first-impressions/elm_logo.png" />

With new frontend development frameworks and libraries popping up everyday, it is becoming difficult for one to actually stand out.

Elm got my attention during the whole redux craziness. Redux is amazing, I have used it on large scale projects and it is a fantastic architecture. That being said, being a curious person, I dug into the origins of redux and found out that Dan Abramov was inspired by Elm.

# What is Elm

In a few words: Elm is a purely functional statically typed programming language for the web. It brings the advantage of static types to frontend development, brings (forces) developers to think in a functional programming paradigm and supports JavaScript interop.

It is a large subject to cover, if you want a quick overview, I suggest you read the Elm article on [learnxinyminutes](https://learnxinyminutes.com/docs/elm/).


# Some Neat Features

## Static Typing and Compiler

One thing that JavaScript developers live with on daily basis is the dreaded `undefined is not a function` message and the constant `console.log` calls. JavaScript can be hard to debug. We have more and more tools to help us but we are always on the verge of trying to access an undefined property.

Elm is fantastic about this aspect. Elm compiles to JavaScript and to successfully do it you must have your function input and outputs aligned. Otherwise, it won't compile. I often thought that this behavior is what turned me off from languages like Java but I was wrong. 

Another fantastic thing about Elm is that `null` does not exist. Trust me, that alone saves hours.

One last thing: the compiler is your friend. Really, this isn't a joke or figure of speech.

![elm-compiler](/assets/elm-first-impressions/elm-compiler.png)

## Purely Functional

Functional Programming works for me. I am not (anymore) an advocate of "FP is better than OO, what's wrong with people". Whatever suits your needs and mindset works. Over the years, I have come to realize that working in a functional programming paradigm is just easier for me.

This means that Elm's primary building blocks are functions. Even simple values are actually functions. Your application itself is one big function. Classes do not exist, you only get modules that regroups your cohesive functions. 

Perhaps the most characteristic of a purely functional language: there are no side effects (i.e. mutating state). Elm respects that to the maximum. There are side-effects, yes, otherwise the application would be useless. The side-effects are just pushed to both limits of your application (input and output).

## The Elm Architecture

Elm comes with its own architecture, simple named: the Elm Architecture. It is the inspiration behind Redux and Cycle.js' MVI pattern.

Simply put, it's composed of 3 parts: Model, Update, View. 

- Model: The state of your application.
- Update: Updating your application's state.
- View: The HTML representation of your state.

An Elm application never goes outside of these 3 parts. It might sound like a big constraint but in the long run, it just help debugging your application. You just need to ask yourself what is your bug and the answer will point you to where you need to look at.

## Interop

I did my first "real" application with a Firebase backend and rather than trying to port Firebase in elm (there is an available elm package that is outdated), I used the Elm ports to communicate with it. 

The ports also respect the Elm architecture which makes the integration of existing JS libraries a matter of building interfaces to the outside world.

# My Impressions

The combination of functional programming and static typing alone is worth trying Elm out. 

Like I mentionned earlier, I use to think that compilation and typing is what drove me off "classic" languages like Java. Actually, static typing and compilation are very helpful and removes a layer of debugging. Sure, you could use TypeScript, but sadly my experience with TypeScript consisted mostly of defining types for external libraries that still didn't protect me from errors.

I developed a jazz album checklist with a Firebase backend in less than a day. I spent most of my time developing the Firebase mechanism rather than the application logic. The whole logic was finished in 2 hours.

Elm is a great language. The community is great (check out their Slack group). It helps bringing good practices and has a solid foundation. Many frameworks and libraries were based on Elm and its architecture which is a testimony of how great it is.

Try it out.