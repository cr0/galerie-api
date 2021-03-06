node(:id) { |picture| picture._id.to_s }

attributes :name, :created_at, :updated_at

child :sources do
  attributes :name, :url, :width, :height
end

node :meta do |picture|
  {
    sources: picture.sources.length,
    persons: picture.persons.length,
    tags: picture.tags.length,
    location: picture.location.nil? ? 0 : 1
  }
end

