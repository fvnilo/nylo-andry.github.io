---
layout: post
title: "Introduction to functional programming."
excerpt: "
Functional programming is nothing new. It existed for a long time but recently became trending for its concise and declarative style. It is closer to mathematics than its counterpart, imperative programming ..."
tags: [functional programming]
comments: true
share: true
---

Functional programming is nothing new. It existed for a long time but recently became trending for its concise and declarative style. It is closer to mathematics than its counterpart, imperative programming, which makes it simple to reason about. This article is a basic introduction to the paradigm and I encourage you to dig in deeper. Learning FP will most likely contradict with what you believe in but keep in mind this is a completely different way of writing programs.

# Why ?

You may ask yourself why would you switch to functional programming. To answer that perfectly legitimate question properly, I think a look a object-oriented programming is needed.

Objects are states and behavior. Every OO programmer wrote some kind of DTO with multiple properties with getters and setters. On a high-level point of view, DTOs and any classifications of objects are state machines with a virtually infinite number of possible states and transitions (you may have business rules that prevent some properties to have illegal values).

![Objects as state machines](images/functional-programming/objects.png)
