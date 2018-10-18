# Notes for Git Workshop presentation

These are my presenter notes, made for printing.

## Overview

1. First, I will go through what version control is, and why it's a good idea to use it for any type of project
2. Then, in very general terms, I will talk about the central concepts in Git
3. Then, I will briefly cover the features provided by GitHub
4. Then, we will do a live demonstration, going through each step involved in a collaborative workflow
5. Then, **you** will set up Git together with a graphical interface on your computers
6. Then, we will walk you through, step by step, how to set up a repository to use for your P1 projects
7. If there's any time left after that, we have some exercises for you

## Why VC/Git?

As the name implies, a VCS gives you control over the _version_ of your project.
In practice, this means

- You have a history tree of changes made over the course of the project

    While working, you mark certain points in time as snapshots of your project, so to speak.
    You give these snapshots apt descriptions, so that at any point, you can easily see what changes have been made when, and even go back to an earlier state.

- With an online repository (e.g. on GitHub), working on the same project is both easy and structured

    A VCS makes sure no changes go unnoticed;
    On a cloud service like Dropbox, if the same file is saved by two different people, whoever saved the latest version "wins".
    With a VCS, conflicting changes are made visible, so you can select which parts should "win" (may be both).
