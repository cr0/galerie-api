class PictureSource
  include Mongoid::Document

  validates_inclusion_of :name, in: [ 'low', 'mid', 'high', 'original' ]

  field :name, type: String
  field :url, type: String
  field :width, type: Integer
  field :height, type: Integer

  embedded_in :picture

end
