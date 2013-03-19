# RSSS

A public service that aggregates multiple social network feeds into one.

## Setting Up For Development

This guide assumes some familiarity with Rails. If you would like some more basic
info see the Ruby on Rails
[Getting Started Guide](http://guides.rubyonrails.org/getting_started.html) or this [tutorial](http://railsapps.github.com/installing-rails.html).

### Prerequisites

In order to run the code in development you will need to install a Ruby interpretter (MRI Ruby 1.9.3 recommended) and Sqlite. On Mac and Window these dependencies can be installed through the [Rails Installer Project](http://railsinstaller.org/).

### Dependencies

Like most rails apps, the gem dependencies for RSSS are manage by [bundler](http://gembundler.com/). To install them simply `cd` into the root folder of the app and run `$ bundle install`.

### API Keys

RSSS needs API keys for Twitter integration. These are not checked into source controll for security reasons so in order to run the app you need header over to https://dev.twitter.com/ and create your own. Once you have done so create a copy of `config/application.yml.example` called `config/application.yml` and fill it in with your API credentials.

### Create the Database

To create the database and setup the database run these two commands:

```
$ rake db:create:all
$ rake db:migrate
```

### Start the Server

To start a development server running on your machine use the command: `$ rails server`. If you have followed the above steps correctly you should be able to visit the app at [http://localhost:3000](http://localhost:3000).