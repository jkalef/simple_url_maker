# README

## Ruby version
Make sure you have ruby version 2.7 installed

## System dependencies
Make sure you have a version of postgres installed and running on your local machine

## Getting Started
- install dependencies `bundle install`
- Create and migrate your db `rake db:create db:migrate`
- start server `rails s` (will start on 3000. Use -p option to specify a different part)
- rails c opens a developer console
- navigate to `http://localhost:3000` to use 

## How to run the test suite
rspec spec

## General Notes
- The app is written with just rails and erb templates.  It's been a while since I've used these parts of rails so was a little rusty.  Most of the applications I've worked on over the past few years (and all the tech at JS) are rails APIs , node APIs and Javascript client applications (mostly React on client-side)

## TODOs with more time:

### URL Validation:
- Currently using a ruby built-in library to validate that the long urls users input are correct.  With more time, I would add a little more validation on the input urls with something along the lines of running a quick scrape of that URL to make sure it returns an http status of :ok/200

### Testing:
- Would add a few more tests, including tests to make sure the regex for the tiny url is correct

### Dev Environment
- Would spend a little more time and dockerize the application, making it easy for other developers to boot up the app with the same dev environment

### Deployment
- the app is simple enough to deploy on any AWS service (such as elastic beanstalk or ECS) or even heroku for even simpler deplyoment
- Would probably host the database on AWS RDS postgres or aurora for the read replica power (if we expect a tonne of users)
- If the app grew, would look into hooking up a nice CI/CD workflow with somelike like CircleCI, and potentially add things like feature flags to make development and feature releases more efficient

### Alerting & Monitoring
- would hook in a few tools like Sentry to catch exceptions and send alerts if the app is not working as expected
- Would also add some APM monitoring with something like New Relic to be able to get a good analytical view of the performance of the app and the various endpoints
- Would come up with a list of business metrics we want to track, and implement some logging or a dashboard to track these.  I.e., total urls made, total urls visited, etc.

### Sharing URLs
- would add a quick mailer that can email the url to a friend