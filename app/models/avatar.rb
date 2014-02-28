class Avatar
  include Mongoid::Document

  validates_presence_of :provider, :url

  field :provider, type: String
  field :url, type: String

  embedded_in :user
end
