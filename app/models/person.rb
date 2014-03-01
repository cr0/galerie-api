class Person
  include Mongoid::Document

  validates_presence_of :name

  field :name, type: String

  has_and_belongs_to_many :pictures, inverse_of: :person
  has_and_belongs_to_many :buckets, inverse_of: :persons

end
