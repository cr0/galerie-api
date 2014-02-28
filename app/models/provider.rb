class Provider
  include Mongoid::Document

  validates_presence_of :name, :uid

  field :finalized, type: Boolean, default: false
  field :name, type: String
  field :uid, type: String

  embedded_in :user
end
