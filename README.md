# OmniAuth Slack SignIn

This gem contains Slack SignIn strategy for OmniAuth.

## Install

Add this gem to your Gemfile:

```ruby
gem 'omniauth-slacksignin', github: 'ignat/omniauth-slacksignin'
```

## Setup

Add the folowing code to your Devise initializer:

```ruby
config.omniauth :slacksignin, ENV['SLACK_APP_ID'], ENV['SLACK_APP_SECRET'], scope: 'identity.basic'
```

Add callback routes to your config/routes.rb:

```ruby
devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
```

and then add slacksignin method to omniauth_callbacks_controller.rb:

```ruby
def slacksignin
  omniauth = request.env["omniauth.auth"]
  # Use team_id, user_id, user_name to identify logged in user
end
```

# OmniAuth Options

You can pass OmniAuth options during initialization:

```ruby
config.omniauth :slacksignin, ENV['SLACK_APP_ID'], ENV['SLACK_APP_SECRET'], scope: 'identity.basic', name: 'slack'
```

This will change the provider name to 'slack'.

# Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
