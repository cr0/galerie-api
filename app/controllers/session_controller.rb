class SessionController < ApplicationController
  respond_to :json

  def create
    auth = request.env['omniauth.auth']

    user = User.where('provider.name' => auth['provider']).and('provider.uid' => auth['uid']).first

    if user && user.is_finalized?
      #@message = "login successfull using provider #{auth['provider']}"
      #respond_with @message, :status => 200

    elsif user
      #@message = "user account found using provider #{auth['provider']}, but not finalized"
      #respond_with @message, :status => 201

    else
      user = User.create_with_omniauth!(auth)
      user.tokens.create!(ip: request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip)
      logger.info "created a new user #{user._id}"
      #@message = "user account created using provider #{auth['provider']}, finalize account"
      #respond_with @message, :status => 201

    end

    redirect_to (request.env['omniauth.origin'] || '/') + "/#{user.tokens.last.spice}"
  end

  def destroy
    session[:user_id] = nil
    head :no_content
  end

  def failure
    @error = "authentication failed, provider (#{params[:strategy]}) says: #{params[:message]}"
    respond_with @error, :status => 403
  end
end
