---
layout: post
title: "Clojure: The most beautiful programming language I have laid my eyes upon"
excerpt: "You see all those parentheses but you have to look beyond it."
tags: [functional programming, clojure, immutability, programming]
comments: true
share: true
---
# The choice

You see all those parentheses but you have to look beyond it. Clojure (and other LISP dialects) have a reputation of looking like a big mess with all those parentheses all over the place. Those who dig a bit and understand that Clojure is homoiconic are immediately charmed.

The way I fell into Clojure was simple: I discovered this (not so) brand new paradigm called Functional Programming and really liked the idea. Like I mentioned previously, [Scala where I began](http://nylo-andry.github.io/First-Steps-Functional/), but it didn't feel 100% right for me even though I would still recommend fellow developers, especially those coming from Java, to try it. I tried Haskell, but it look a tad too rigid for my taste. Being a massively lazy language, I did not feel comfortable with it (and that is my opinion, I respect anyone believing what they believe in). Haskell syntax also looked pretty weird to me.

I ultimately stumbled on Clojure and thought to myself: "It actually looks nice."

Clojure is elegant, simple, functional (specifically, I feel it encourages the good practices of functional programming), is based on libraries and can achieve great things. Let me stress something just a bit. I do not like frameworks per se. I do use them in personal and professional projects but I tend to limit the inclusion of magic in my code. From my experience, being bound to a framework can result in massive changes when trying to update or worse, if you find out the framework you use isn't fit for your needs, you might have a massive codebase or design structure to throw away. On the other hand, libraries can be replaced and tested. My penchant for libraries might have something to do with the fact that I embrace composition when developing.

# Refactor to elegancy

One of the first function I wrote in Clojure looked like this:

    (defn calculate-resized-dimension
      [width height ratio]

      (def resized-width (* width ratio)
      (def resized-height (* height ratio))

      [resized-width resized-height])

Just looking at it made me think: "Something is wrong" and oddly in other languages, I might not have had that thought. I already read a few lines of Clojure and the format of what I wrote seemed wrong, as well as the two lines that were very similar that were stacked one after the other. A few readings later, I refactored:

    (defn calculate-resized-dimension
      [width height ratio]
      (let [resized-width (* width ratio)
            resized-height (* width ratio)]
        [resized-width resized-height]))

And again:

    (defn calculate-resized-dimension
      [ratio & dimensions]
      (map #(* % ratio) dimensions))

The purpose of my function was simple, yet I was amazed. It looked elegant, simple and clean. Even my first refactor looked good enough:that let form is one powerful tool to have in your toolbox.

# There's a function for that !

Exploring the Clojure core library makes your discover a ton of function. Personally, I do not remember half of what I have seen but I invite you to take a look at the [Clojure core library documentation](https://clojuredocs.org/clojure.core)

Each time I have a problem to solve, I automatically think "There must be a function for that.." and most of the time there is. Worst case: I can compose a few functions together to achieve what I want.

# Immutable data structures

Clojure data structures (maps, vector, sets, etc.) are immutable. When data structures are immutable, it encourages you to write pure functions. When you write pure functions, you make applications that are easy to reason about. I love it.

# Code in emacs like it's 70's

When exploring Clojure, you eventually come across posts and books about emacs. It is weird to think that a nearly 40 years old editor written in LISP can still be used to develop entire projects but this guy is still in pretty good shape. I have used in the past free shiny editors and IDE that cost 12,000$ USD (Thank you MSDNAA for letting me try those) but nothing has made me more productive than writing Clojure in emacs.

Setting up emacs in clojure-mode and fire a REPL session is something you always wanted even if you did not know. It is possible, with a set of key bindings to execute only bits of code or individual functions from your editor (or the REPL session) and that is one of the most essential tool a developer should have.

If you want to try it out, I invite you to read [this chapter from Clojure for the Brave and True](http://www.braveclojure.com/basic-emacs/) and set up your own emacs.
