class BucketController < ProtectedController
  respond_to :json

  # GET /buckets
  def index
    respond_with @buckets = Bucket.all
  end

  # GET /buckets/1
  def show
    respond_with @bucket = Bucket.find(params[:id])
  end

  # POST /buckets
  def create
    @bucket = Bucket.new bucket_params

    if @bucket.save
      render :show
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /buckets/1
  def update
    if @bucket.update(bucket_params)
      redirect_to @bucket, notice: 'Bucket was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /buckets/1
  def destroy
    @bucket.destroy
    redirect_to buckets_url, notice: 'Bucket was successfully destroyed.'
  end

  private
    def bucket_params
      params.require(:bucket).permit(:name, :users)
    end
end
