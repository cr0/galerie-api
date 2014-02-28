class Picture
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :name, :author

  field :name, type: String
  field :pending, type: Boolean, default: true

  embeds_one :location
  embeds_many :tags
  embeds_many :sources, :class_name => 'PictureSource'
  belongs_to :author, :class_name => 'User', inverse_of: :pictures
  has_and_belongs_to_many :buckets

end
