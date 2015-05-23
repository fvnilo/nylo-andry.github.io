---
layout: post
title: "Smells - Nested if's"
excerpt: "Coding is essentially writing and everybody has their own writing style. We all wrote atrocities in our code at a certain moment and we knew it or at least realized it later on. "
tags: [development, practice, clean code]
comments: true
share: true
---
## Introduction ##

Coding is essentially writing and everybody has their own writing style. We all wrote atrocities in our code at a certain moment and we knew it or at least realized it later on. The other scenario is: you read someone else's code and all those smells made you sick. Every developer virtually code differently but some of the things we write aren't helping anyone.

In this series, I will try to describe my pet peeves in code and how I clean them. Keep in mind, I also wrote those smells and more than once during my career. It made sense to me when I wrote them but I have a tendency to think about making my code better.

## Today's smell ##
Example:

    function fetchClients(connection) {
        if (connection) {
            var session = connection.getSession();

            if (session.isActive()) {
                var entities = session.requestAll("Client");

                if (entities.length > 0) {
                    return convert(entities);
                }

                return null;
            }

            return null;
        }

        throw "Connection not opened";
    }

There is a few things that are wrong in this function but I want to stress one point that I see pretty often: __cascading if's__. Some people tolerate it, but it always bothered me. Refactoring it and keeping the same code is pretty simple. It will look like something similar to:

    function fetchClients(connection) {
        if (!connection) {
            throw "Connection not opened";
        }

        var session = connection.getSession();
        if (!session.isActive()) {
            return null;
        }

        var entities = session.requestAll("Client");
        if (entities.length > 0) {
            return convert(entities);
        }

        return null;
    }

Voilà. Same code, same result, the flow of the function was adjusted.

_Extra_: This function does way more than it is supposed to. Validating the connection should be done before this function is called aswell as opening the session. A function should always do one and only one thing and it should be short. This is the kind of code I see very often. Someone wrote the whole logic in one function, it worked and it was good enough. I usually do this and then add an extra step of separating everything in smaller functions and try to make it as simple as possible.

    function getSession(connection) {
        if (!connection) {
            throw "Connection not opened";
        }

        return connection.getSession();
    }

    function fetchClients(session) {
        var entities = session.requestAll("Client");
        if (entities.length > 0) {
            return convert(entities);
        }

        return null;
    }

    ...

    var connection = ConnectionManager.getCurrentConnection();
    var session = getSession(connection);
    if (session.isActive()) {
        return fetchClient(session);
    }

    return null;
