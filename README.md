# Montclair Portal

## Models
### User
```ruby
has_many :blogs
has_many :topics
has_many :posts
```
### Blog
```ruby
belongs_to :user
```
### Forum
```ruby
has_many :topics
```
### Topic
```ruby
belongs_to :forum
belongs_to :user
has_many :posts
```
### Post
```ruby
belongs_to :topic
belongs_to :user
```

# GEMS

## coffee-rails
* For coffescript. CoffeeScript is a little language that compiles into JavaScript. http://coffeescript.org/
* Js To Coffescript Converter http://js2.coffee/

## haml, haml-rails
* Beautiful, DRY, well-indented, clear markup. http://haml.info/
* HTML to HAML converter http://html2haml.herokuapp.com/

## bootstrap-sass
* For bootstrap framework. http://getbootstrap.com/

## responders
* Fat model skinny controller. A set of Rails responders to dry up your application https://github.com/plataformatec/responders

## exception_notification
* Exception notifier for production. The Exception Notification gem provides a set of notifiers for sending notifications when errors occur in a Rack/Rails application. https://github.com/smartinez87/exception_notification


## simple_form
* Form builder. Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup. https://github.com/plataformatec/simple_form

## show_for
* Wrap your objects with a helper to easily show them https://github.com/plataformatec/show_for

## rails_config
* Easiest way to add multi-environment yaml settings to Rails 3 or 4. https://github.com/railsconfig/rails_config

## compass-rails, compass
* Compass is an open-source CSS Authoring Framework. http://compass-style.org/help/

## devise
## will_paginate
## paperclip
## rack-timeout
## annotate
## recipient_interceptor
## ransack
## capistrano, capistrano-ext
## unicorn
## aws-sdk
