class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

protected

  def current_user
    authenticate_with_http_token do |token, options|
      return unless token =~ /[A-Za-z0-9\-_=]{64}/i
      ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
      @current_user ||= User.where(:"tokens.spice" => token).and(:"tokens.ip" => ip).first
    end
  end

  helper_method :current_user

end
