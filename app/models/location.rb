class Location
  include Mongoid::Document

  validates_presence_of :name, :loc, :partial

  field :name, type: String
  field :partial, type: Array
  field :loc, type: Array

  index({ location: "2d" }, { min: -200, max: 200 })

  embedded_in :bucket
  embedded_in :user

end
