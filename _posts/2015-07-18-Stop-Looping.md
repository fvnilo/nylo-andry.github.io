---
layout: post
title: "Stop Looping ! Be Functional !"
excerpt: "It is a very common pattern to loop over collection and do some kind of processing on each element, but today's libraries and languages offer some nice and clean functions to write cleaner and easier to reason about code."
tags: [practice, clean code, functional programming, scala, map, flatMap, reduce, javascript, lodash]
comments: true
share: true
---

# The Looping Pattern

It is a very common pattern to loop over collection and do some kind of processing on each element, but today's libraries and languages offer some nice and clean functions to write cleaner and easier to reason about code. With the emerging popularity of functional programming many possibilities are offered.

I have wrote this kind of code for a long time:

    function doubleAll(numbers) {
      var doubles = [];

      numbers.forEach(function(number) {
        doubles.push(number * 2);  
      });

      return doubles;
    }

Nothing is wrong in this (JavaScript) function really at some degree, it doubles all the numbers in an array and returns them. At some point, you will tell yourself that this is a lot of code to simply double every numbers in an array.

What if you wanted to triple them? You would created another function or pass the multiplier as an argument.

There is a lot of thing you might want to do:
- Only return odd numbers.
- Do a certain operation on each number.
- Accumulate them by doing some complex operation.
- Concatenate them in a string to display them.

The forEach method will allow you to do all of that but I always found it was too much of a common pattern to not be simplified and written concisely.

# The Functional Way

There are many ways in many languages to do such operations in (virtually) one-liners. For the rest of this post, my code will be in Scala, but you can achieve anything mentioned here in JavaScript, Java 8, .NET (with Linq) and many other technologies that spark your interest. We will take a look at certain combinators that each satisfies a precise situation.

## `filter`

It is common to want to hold only the elements of an array that satisfy a predicate:

    val integers = List(1, 2, 3, 4, 5, 6)
    val oddIntegers = integers.filter(x => x % 2 == 1) // List(1, 3, 5)

## `map`

This function takes a function as its parameter and applies it to each element of an array:

    val integers = List(1, 2, 3, 4, 5, 6)
    def doubleNumber(x: Int) =  x * 2
    val integersDoubled = integers.map(doubleNumber) // List[Int] = List(2, 4, 6, 8, 10, 12)

Voilà! Less lines of code for the same result. If you want to triple the numbers or do anything more complicated with them, you just have to implement your own function and pass it to map.

**An important note**: The output type doesn't have to be the same as the input type.

    def doubleNumber(x: Int) =  x * 2
    def numberToString(x: Int) = x.toString
    val doubleAndThenToString = doubleNumber _ andThen numberToString _
    val integersDoubled = integers.map(doubleAndThenToString) // List[String] = List(2, 4, 6, 8, 10, 12)

This will allow you to build objects perhaps based on the values of an array in a concise, flexible and clean way.

## `flatMap`

The way I like to see the `flatMap` function is that it is the same thing as the `map` function but it flattens the result by one level:

    def doubleNumber(x: Int) =  x * 2
    val integersNested = List(List(1, 2), List(3, 4, 5), List(6), List(7, 8, 9))
    val notNestedAnymore = integersNested.flatMap(x => x.map(doubleNumber)) // List[Int] = List(2, 4, 6, 8, 10, 12, 14, 16, 18)

## `reduce`

This one is interesting. The `reduce` function will combine all the element of your array into one and the aggregation will be done by applying the function you pass as its parameter. Keep in mind: it **combines** them. That means the output type must be the same as the input type.

    val integers = List(1, 2, 3, 4, 5, 6)
    val sumOfIntegers = integers.reduce((acc, x) => acc + x) // Int = 21. Note: the `sum` function exists, this is just to show you
    val integersReduced = integers.reduce((acc, x) => (acc * x) - x) // Int = -516

You will notice that a accumulator is passed at each iteration to keep track of the state of the reduction.

## `fold`

This is the same thing as the `reduce` function but with a twist: the output type doesn't have to be the same as the input type. This can be very useful to create an initial state and then accumulate the values of the array over it:

    val integers = List(1, 2, 3, 4, 5, 6)
    val integerFolded = integers.fold("Initial string value: ")((acc, x) => acc + x.toString + ".") // Any = Initial string value: 1.2.3.4.5.6.

# Where to go next ?

The examples were simple because the purpose of this article was to demonstrate the alternatives of looping over a collection and do some processing. The `map` function can simplify your data structure instanciation from an List( to another. The `flatMap` function too. `reduce` and `fold` will give you an hand to aggregate values. These situations happen more often that you think if you were not familiar with those combinators.

I encourage you to start identifying those situations in your code and you will be able to use the proper combinator. It will be just a matter of time before you begin to be comfortable with it. Your code will be simpler, more concise and more flexible in the long run.
