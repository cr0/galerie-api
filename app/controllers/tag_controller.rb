class TagController < ProtectedController
  respond_to :json

  # GET /tag/reduce
  def reduce
    map = %Q{
      function() {
        if (this.tags == null) return;
        this.tags.forEach(function(tag) {
          emit(tag.name, 1);
        });
      }
    }

    reduce = %Q{
      function(key, values) {
        return Array.sum(values);
      }
    }

    @tags = []
    Entity.map_reduce(map, reduce).out(inline: 1).each do |document|
      @tags << OpenStruct.new(document)
    end
    respond_with @tags
  end

  # GET /tag/1
  def show
    @tag = OpenStruct.new(id: params[:id], name: params[:id], pictures: [], buckets: [])

    Entity.where(:'tags.name' => params[:id]).each do |document|
      case document.class.name
        when 'Picture' then @tag.pictures << document
        when 'Bucket' then @tag.buckets << document
      end
    end

    respond_with @tag
  end
end
