# The Day I Went Full React

## The First Impression

It took me a while to really dive into React. It actually took me a year. Here is how it went:

In one of the newsletter I am subscribed to, there was an article about a library named React that was new to me. I believe they were at v0.10 at that time. Along with the article was a link to a YouTube video about the architecture that supported it best: Flux. Everything made sense to me. The architecture, though non-traditional, made sense in the context of web applications. Then I saw some React code in JSX:


    // https://facebook.github.io/react/index.html
    var HelloMessage = React.createClass({
      render: function() {
        return <div>Hello {this.props.name}</div>;
      }
    });

    React.render(<HelloMessage name="John" />, mountNode);

And I hated it.

## Another path

Later on I found out about Web Components and really liked the path it was taking. It was clean, semantically clear and was easy to reason about. Long story short, I had an ongoing project with some partners overseas and I proposed to try out Polymer. At that time, in our case and it might be because of out inexperience with Polymer, we had performance issues even before we started making API calls.

I strongly believe Web Components are great, just not ready yet. I firmly believe that in a year or so the community will be able to achieve amazing projects with Polymer. I will go back to them one day.

## Looking around

About six months ago, my job mainly consisted of being a Knockout.js programmer. It was actually great, I think I liked it better than Angular. Actually, it was only the parts I felt I needed from Angular wrapped in a different library: Components and Bindings. Still, I felt you had to write a lot of boilerplate code (especially for SPA's) for simple neat features.

I also, like many of my friends, was messing around with Angular. I liked it a lot but I found myself always having to deviate from the "Angular way" and it made me write code that was not nice. Also, I felt I was more of an Angular developer when committing to this technology and not really a JavaScript developer.

## React Again

During that whole time, a friend of mine, Makara Sok, the founder of [Player.me](https://player.me) urged me repeatedly to check React more seriously. He built his product with it and things seemed to go really well for him. One day, I told myself "Why not?". So I looked passed the syntax that was weird to me at first and tried it... for real this time.

### Second Impression

Since I played with Polymer and Web Components in general, I found it pleasant to see the same concept with React components: allowing a developer to build them individually and compose them to give birth to a more complex one. Having Flux behind it, when you break away from the MVC mentality and truly embrace it, makes you appreciate it even more.

## Some of the advantages I found so far

In no particular order (maybe a little):

- When your HTML-ish code is not properly constructed, your code does not compile.
- HTML and JavaScript are bound together in our minds and it is fully okay. JSX uses the full power of JavaScript and injects HTML in it to build your applications instead of having a weak technology like HTML and trying to put some JavaScript here and there to try to make something nice.
- Flux is amazing. Try it. It might take some time before you grasp it but try it.

## Where to go next

- [Scotch.io's tutorials](https://scotch.io/tutorials/learning-react-getting-started-and-concepts) is a great point of start.
- Flux is great, but do not implement all the boilerplate code by yourself each time please. Being a functional programming enthusiast, the framework that works the best for me (even though it is technically not 100% Flux) is [Redux](https://github.com/rackt/redux). I recommend you watch Dan Abramov's [talk](http://www.youtube.com/watch?v=xsSnOQynTHs) about his framework.
- I asked the mobile team at my current job about [React Native](https://facebook.github.io/react-native/) and they said it is a very good first step to mobile development.
- Give it a try and evaluate if you like it or not.

More posts to come about React coming soon !
