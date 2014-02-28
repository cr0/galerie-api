OmniAuth.config.logger = Rails.logger
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['OAUTH_FACEBOOK_APPID'], ENV['OAUTH_FACEBOOK_SECRET'],
    :scope => 'email,user_birthday', :display => 'popup', :provider_ignores_state => true

  provider :google_oauth2, ENV['OAUTH_GOOGLE_APPID'], ENV['OAUTH_GOOGLE_SECRET'],
    :scope => 'https://www.googleapis.com/auth/userinfo.profile,https://www.googleapis.com/auth/userinfo.email'

  provider :amazon, ENV['OAUTH_AMAZON_APPID'], ENV['OAUTH_AMAZON_SECRET'],
    :scope => 'profile'
end
