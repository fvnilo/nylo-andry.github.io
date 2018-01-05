---
layout: post
title:  "Every time I test a new framework, I develop a timer"
date:   2017-03-24 00:00:00 -0500
categories: development, frontend, code
---
I think it is safe to say that everyday, a new JavaScript framework or library is born. I do not mind it at all, it shows that the community is active. On the other hand, it becomes unthinkable to keep up with all these ideas.

I used to want to try everything that it new in terms of front-end development in JavaScript (or any other languages) and I needed to find a way to test these frameworks I discovered.

**My personal choice**: develop a timer.

![Timer](/assets/first-project-timer/clock.jpg)

# What exactly and why?

By timer, I do not mean an app that simply tells you how many seconds have passed since you clicked on a button. Usually, I aim for a timer that:

- Starts at 60 seconds and starts counting down when I click on a button
  - Bonus: User can set the time
- Can be stopped
- Can be reset
- That automatically stops when the time reaches 0
- The time is displayed on screen (duh!)

My reasoning is simple. This minimal set of feature is enough to test asynchronicity, user interactions, user expectations and states that can be manually set. The only aspect that is missing is making network requests but that can be tested with more interesting examples.

*Please note*: this is not the only example I do. A real-world app is more complex than a timer, but if I am not able to build one easily with a given framework, I usually do not try to make something more complicated.

# Simple but important questions

A timer is small enough to be completed in an hour and is just a bit more complex than introductory examples of libraries and frameworks. The questions I ask myself when I create one are:

- Where do I plug the interval?
- How do I set my state?
- Is this way of doing things pure enough for my tastes?
- How much code did I have to write for this?
- How was the boiler plating?
- Can the view be updated without any trouble?
- Can I debug this easily?
- Are there any devtools?
- Was it easy to debug the asynchronous updates?
- It’s interesting how an every day idea can generate so much questions. The answers to those questions help me evaluating a JS framework in an hour.

I am aware that it will generally result in an slightly over-engineered application but it helps interpolating the boilerplate vs the code to write for the logic.

# Examples
I have three examples on GitHub:

- [redux](https://github.com/nylo-andry/react-stopwatch)
- [Vue.js](https://github.com/nylo-andry/stopwatch-vuex)
- [Cycle.js](https://github.com/nylo-andry/cycle-timer)