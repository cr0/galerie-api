class UserController < ProtectedController
  before_action :set_user, only: [:edit, :update, :destroy]
  respond_to :json

  # GET /users
  def index
    respond_with @users = User.all
  end

  # GET /users/1
  def show
    if params[:id].to_s == 'me'
      return head :unauthorized unless current_user
      respond_with @user = current_user
    else
      respond_with @user = User.find(params[:id])
    end
  end

  # POST /users
  def create
    head :method_not_allowed
  end

  # PATCH/PUT /users/1
  def update
    if @user.update_attributes user_params
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    head :no_content
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:name, :nick, :email, :birthday, :avatar, :provider)
    end
end
