class Bucket < Entity
  include Mongoid::Document

  validates_presence_of :authors

  has_and_belongs_to_many :authors, :class_name => 'User', inverse_of: :buckets
  has_and_belongs_to_many :persons
  has_and_belongs_to_many :pictures

end
