node(:id) { |bucket| bucket._id.to_s }

attributes :name, :created_at, :updated_at

node :meta do |bucket|
  {
    pictures: bucket.pictures.length,
    persons: bucket.persons.length,
    authors: bucket.authors.length,
    tags: bucket.tags.length,
    location: bucket.location.nil? ? 0 : 1
  }
end
