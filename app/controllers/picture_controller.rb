class PictureController < ApplicationController
  respond_to :json

  # GET /pictures
  def index
    respond_with @pictures = Picture.all
  end

  # GET /pictures/1
  def show
    respond_with @picture = Picture.find(params[:id])
  end

  # POST /pictures
  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      redirect_to @picture, notice: 'Picture was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /pictures/1
  def update
    if @picture.update(picture_params)
      redirect_to @picture, notice: 'Picture was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /pictures/1
  def destroy
    @picture.destroy
    redirect_to pictures_url, notice: 'Picture was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def picture_params
      params.require(:picture).permit(:name)
    end
end
