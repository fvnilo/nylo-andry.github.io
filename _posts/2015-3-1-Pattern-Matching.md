---
layout: post
title: "Pattern Matching"
excerpt: "I have came across JavaScript projects with great structure by which I mean that were modularized neatly whether it was by using browserify, AMD or immediately invoked functions. Some of those projects used gulp.js and I was surprised to see that, in some cases, they let the `gulpfile.js` file grow and put everything in the same file. "
tags: [web development, web components, polymer]
comments: true
share: true
---

No. This post is not about regular expressions. There is a [Wikipedia article](http://en.wikipedia.org/wiki/Regular_expression) and many more sources around the internet that will cover that subject in depth.

In this blog post, I will be talking about the functionnal programming concept that is called pattern matching. I usually write about JavaScript stuff, but here I am going to write examples in Scala. If you do not know Scala I suggest you take a look at the language's [documentation](http://www.scala-lang.org/documentation/).

What is this pattern matching thing I am talking about? The short answer is: it is a switch-case for function. I hate switch-cases. I personally think it is not elegant and can always be replaced by a dictionary, but that is another subject. The important part here is "for functions".

Let's begin with an example to demonstrate what it means.

## The factorial function

Here is a classic implementation of the factorial function:

	def factorial(n: Int): Int = {
		if (n == 0) 1 else n * factorial(n -1)
	}

Except for the language syntax for those who never touched Scala, nothing should be cryptic here. But here is a twist of the same function:

	def factorial(n: Int): Int = n match {
		case 0 => 1
		case n => n * factorial(n - 1)
	}

## Wildcards and types

The definition of the factorial function itself is based on a pattern. Depending on the value of `n`, we get different behaviors. Some of you who read this might say "Well, you are only using a switch-case to return different values". Yes, but now let us see how pattern matching goes beyond what you knew about switch-cases. Say we have this function:

	def myFunction(n1: Any, n2: Any, n3: Any): String = (n1, n2, n3) match {
		case (n1: String, _, _) => "You gave me a String as n1."
		case (7, _, _) => "n1 is lucky 7 !"
		case (_, "foo", "bar") => "You gave me n2 as 'foo' and n3 as 'bar'."
		case (n1: Int, "foo", _) => "You gave me an Int as n1 and n2 is 'foo'."
		case (Nil, Nil, Nil) => "All arguments are Nil"
	}

Nothing exciting about its use, two things I like about pattern matching are shown here:

+ The underscores in the case tuples are wildcards. They can be anything because they do not count in the evaluation of your condition. When dealing with wildcards, keep in mind that the order is important. For example, if I inverted my second and third case, calling myFunction(7, "foo", "bar") will never return "n1 is lucky 7!".
+ You can match types. It did not happen often that I needed to pass a very generic object or value to a function then try to guess what type it is but it can happen and pattern matching can help you with that.

Now you can see where this is going, it is a way of having conditions on your arguments without having a series or nest of if/else.

## Case classes

Would you believe me if I told you that this could be more advanced? The next example comes from an online class given by Martin Odersky that I took on [Coursera](htt://coursera.org). It was also very similar to a problem I encountered around the same time I took the class and this is why I am enthusiatic about showing this example.

Let us define our own mathematical world. Our mathematical world is simple:
- There are expressions, which are very generic;
- Types of expressions are: Number, Sum, Product;
- We can show and evaluate expressions.

Nothing too complex. Here is an object oriented implementation of our world:

	abstract class Expr {
		def precedence: Int
		def eval: Int
		def show: String

		def formatWithParentheses(parent: Expr): String = {
			if (parent.precedence > this.precedence) "(" + this.show + ")"
			else this.show
		}
	}

	class Number(n: Int) extends Expr {
		override def precedence: Int = 3
		override def eval: Int = n
		override def show: String = n.toString
	}

	class Sum(l: Expr, r: Expr) extends Expr {
		override def precedence: Int = 1
		override def eval: Int = l.eval + r.eval
		override def show: String = l.formatWithParentheses(this) + " + " + r.formatWithParentheses(this)
	}

	class Prod(l: Expr, r: Expr) extends Expr {
		override def precedence: Int = 2
		override def eval: Int = l.eval * r.eval
		override def show: String = l.formatWithParentheses(this) + " * " + r.formatWithParentheses(this)
	}

It does what we want it to do. Expr is the base class and all expression types extends that class. Every expression now how to evaluate themselves, they know their precedence and they know how to show themselves. Another solution to our problem could be solved by using pattern matching with `case classes`. Let's immediately jump to an example:

	trait Expr

	case class Number(n: Int) extends Expr
	case class Sum(l: Expr, r: Expr) extends Expr
	case class Prod(l: Expr, r: Expr) extends Expr

	def precedence(expr: Expr): Int = expr match {
		case Sum(_,_) => 1
		case Prod(_,_) => 2
		case Number(_) => 3
	}

	def show(expr: Expr): String = expr match {
		case Number(n) => n.toString
		case Sum(l, r) => formatWithParentheses(expr, l) + " + " + formatWithParentheses(expr, r)
		case Prod(l, r) => formatWithParentheses(expr, l) + " * " + formatWithParentheses(expr, r)
	}

	def eval(expr: Expr): Int = expr match {
		case Number(n) => n
		case Sum(l, r) => eval(l) + eval(r)
		case Prod(l, r) => eval(l) * eval(r)
	}

	def formatWithParentheses(parent: Expr, child: Expr): String = {
		if (precedence(parent) > precedence(child)) "(" + show(child) + ")"
		else show(child)
	}

There is something new in this version: the expressions are now case classes and they can be used with pattern matching to have different behaviors. What we have here is what I consider to be a different flavor of polymorphism that lets you manipulate symbols and their parameters very easily. Readers will also notice that no methods were overriden and the implementation looks purified compared to the object oriented solution.

To learn more about pattern matching in functional programming I suggest you take a look at the [Functional Programming Principles in Scala class](https://www.coursera.org/course/progfun) on Coursera and the [pattern matching section](http://learnyouahaskell.com/syntax-in-functions#pattern-matching) of the book "Learn you a Haskell."
