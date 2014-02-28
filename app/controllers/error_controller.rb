class ErrorsController < ApplicationController
  respond_to :json

  def show
    respond_with @error = %Q{error processing request for #{env["ORIGINAL_FULLPATH"]}}, :status => status_code
  end

protected

  def status_code
    params[:code] || 500
  end

end
