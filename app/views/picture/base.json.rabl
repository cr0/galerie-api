node(:id) { |picture| picture._id.to_s }

attributes :name, :data_src, :created_at, :updated_at

node :meta do |picture|
  { tags: picture.tags.length, location: picture.location.nil? ? 0 : 1 }
end
