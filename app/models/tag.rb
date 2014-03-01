class Tag
  include Mongoid::Document

  validates_presence_of :name

  field :_id, type: String, default: ->{ name }
  field :name, type: String
  field :pending, type: Boolean, default: false

  embedded_in :bucket
  embedded_in :picture

end
