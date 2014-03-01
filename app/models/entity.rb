class Entity
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :name

  field :name, type: String
  field :pending, type: Boolean, default: true

  embeds_one :location
  embeds_many :tags
  has_and_belongs_to_many :persons

end
