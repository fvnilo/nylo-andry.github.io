---
layout: post
title:  "How To Rewrite Your Git Commit Messages"
date:   2018-03-20 00:00:00 -0500
categories: development, code, source control, git
---
This post is not about **why** writing good commit messages is important. I think [this article](https://chris.beams.io/posts/git-commit/) explains it better than I ever will. In this article, I'll show you **how to rewrite** your git commit messages.

The inspiration behind this article is that we recently began to also review git commit messages in submitted pull requests at my current workplace. It may sound rude but I feel that nothing is more frustrating than doing a `git log` and be presented with a stream of meaningless messages such as *fix test*, *i did the JIRA*, *there was a bug in articles.store.js* and *asdfgh*.

Let's get started.

## Rewrite the last commit's message

This is the simplest case. Let's suppose that your git history looks like this:

    7b2e88e I needed to write something
    c4d2ffc Initial commit

The second message (or the first one from the top) is meaningless. We want to rewrite it. It can be done very easily:

    git commit --amend

Poof! This command will open your editor (vim in most cases) and allow you to rewrite your message. You will now have something that looks a little more like this:

    64a365f Implement the Article CRUD API
    c4d2ffc Initial commit

Notice that the hash of the latest commit has changed. If you edited a commit that was already pushed, you will need to **force** the push with:

    git push --force

## Rewrite older commits

How can this happen you may ask? Let's say you worked in small commits to easily keep track of your work and you notice that your message from 3 commits ago has a typo in it. Oh no! How can you fix this? It's easy my friend.

Let's say our git history looks like this:

    ec83970 Added jsdoc to public methods
    e8e5744 Added better robust tsts for the Article API
    64a365f Implement the Article CRUD API
    c4d2ffc Initial commit

Commits ec83970 and e8e5744 could be better. The one talking about tests has a typo and doesn't make sense and the both are using past tense verbs (maybe you do not have that rule). Here is the command how we can rewrite them:

    git rebase HEAD~2 -i

A few explanations:

- `rebase`: The git command that allow you to rewrite your history.
- `HEAD~2`: I always interpret this argument as *apply to the last 2 commits*. This means that if you need to go back 5 commits, replace the 2 in the example with 5.
- `-i`: Do it in interative mode, meaning you will be allowed to manage the commits yourself during the rebase.

Your editor will open with this content:

      pick e8e5744 Added better robust tsts for the Article API
      pick ec83970 Added jsdoc to public methods

      Rebase 64a365f..ec83970 onto 64a365f (2 commands)

Great! Your rebase will include these 2 commits. The next thing you will need to do is replace the command `pick` with `reword` and save the buffer. 

If you have commits included in the rebase that are not meant to be re-written, leave them as `pick`. This will happen if there are commits between the ones you want to `reword`.

One you save and quit, your editor will open again allowing you to edit the messages of the commits you asked to be `reword`ed one after the other.

Do the changes, save each buffer with your new message and your history will now look like this:

    4c77c0c Add jsdoc to public methods of the Article API
    3e1ce81 Add more robust tests for the Article API
    64a365f Implement the Article CRUD API
    c4d2ffc Initial commit

Again, notice how the hashes are not the same as the original history. If you edited commits that were pushed, you will also need to do a `git push --force`.

## Conclusion

Git is powerful. Mastering it takes years but you can do whatever you want with your history, your workflow and files with its mature command line tool. I personally never use any GUI because I find git to be so complex, a UI above it's command line interface tends to be unintuive.

If you want to learn more about git's commands, I recommend the excellent [Pro Git](https://git-scm.com/book/en/v2).