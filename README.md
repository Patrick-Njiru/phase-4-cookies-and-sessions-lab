# Lab Name

## Learning Goals

- Use the session hash to persist data across multiple requests

## Introduction

In this lab, you'll be building out a blog paywall feature by using the session
hash to keep track of how many page views a user has made.

There is some starter code in place for a Rails API backend and a React frontend.
To get set up, run:

```sh
bundle install
rails db:migrate db:seed
npm install --prefix client
```

You can work on this lab by running the tests with `learn test`. It will also be
helpful to see what's happening during the request/response cycle by running the
app in the browser. You can run the Rails server with:

```sh
rails s
```

And you can run React in another terminal with:

```sh
npm start --prefix client
```

You don't have to make any changes to the React code to get this lab working.

## Instructions

Our app will keep track of how many blog posts a user has viewed by using the
`session` hash. Each user can view a **maximum of three articles** before seeing
the paywall.

When a user makes a `GET` request to `/articles/:id`, the following should happen:

- If this is the first request this user has made, set
  `sessions[:pageviews_remaining]` to an initial value of 3. _Hint: consider
  using `||=` to set this initial value_
- For every request to `/articles/:id`, decrement the value of
  `sessions[:pageviews_remaining]` by 1.
- If `sessions[:pageviews_remaining]` has a value greater than 0, render a JSON
  response with the article data.
- If `sessions[:pageviews_remaining]` as a value of 0 or less, render a JSON
  response including an error message, and a status code of 401 unauthorized.

## Resources

- [link 1](example.com)
- [link 2](example.com)