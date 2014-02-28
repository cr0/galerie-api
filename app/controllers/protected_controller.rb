class ProtectedController < ApplicationController
  before_action :authenticate

private
  def authenticate
      current_user || render_unauthorized
  end

  def render_unauthorized
    head :unauthorized
  end
end
