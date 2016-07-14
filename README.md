# PresenterObject

This is a simple presenter base class you can use to create model specific presenters.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'presenter_object'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install presenter_object

## Usage

Given a model class:

```ruby
class User < ActiveRecord::Base
   validates :first_name, presence: true # just to show one of the attributes of this model
end
```

Create a subclass such as:

```ruby
class UserPresenter < PresenterObject::Base
  presents :user

  def formatted_phone_number_or_something_fancy
    I18n.l phone_number, format: :fancy
  end  
end
```

Then wrap a model instance:

```ruby
@user = UserPresenter.new User.find(params[:id])
```

The `@user` presenter object can be used as if it were the model object. Then, just place all presentation methods in the presenter class and call them from the views.

```ruby
@user.class # => User
@user.respond_to? :first_name # => true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DiegoSalazar/presenter_object.

