class Location
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  validates_presence_of :address, :partial

  field :address, type: String
  field :partial, type: Array
  field :coordinates, :type => Array

  embedded_in :bucket
  embedded_in :user

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

end
