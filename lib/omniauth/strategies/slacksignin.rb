require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class SlackSignIn < OmniAuth::Strategies::OAuth2

      option :name, "slacksignin"
      option :authorize_options, [:scope]
      option :client_options, {
        site: "https://slack.com",
        token_url: "/api/oauth.access"
      }
      option :auth_token_params, {
        mode: :query,
        param_name: 'token'
      }

      uid do
        puts callback_url
        "#{identity['team']['id']}-#{identity['user']['id']}"
      end

      info do
        {
          user_name: identity['user']['name'],
          user_id: identity['user']['id'],
          team_id: identity['team']['id']
        }
      end

      extra do
        {
          raw_info: identity
        }
      end

      def identity
        @identity ||= access_token.get('/api/users.identity').parsed
      end

    end
  end
end

OmniAuth.config.add_camelization "slacksignin", "SlackSignIn"
