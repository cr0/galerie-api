class Picture < Entity
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :author

  embeds_many :sources, :class_name => 'PictureSource'
  belongs_to :author, :class_name => 'User', inverse_of: :pictures
  has_and_belongs_to_many :buckets

end
