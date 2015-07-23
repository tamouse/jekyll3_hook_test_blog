# Testing jekyll 3 hooks

In Jekyll 3, we're going to get processing hooks that will be awfully
sweet to use.

In this test blog, I'm testing various hooks to see if I can easily
render each post as a JSON file, and a JSON file containing a list of
all the posts.

It's really quite simple when it comes down to it. After playing
around with pry, seeing what was available, I put together a pretty
simple pluging with a couple of hooks in
`_plugins/hooks.rb`.

I'm going to continue experimenting with this, but I declare this a
success!!


## Dependencies

Requires Jekyll 3:
<https://github.com/jekyll/jekyll/releases/tag/v3.0.0.pre.beta8>
