class Token
  include Mongoid::Document
  include Mongoid::Timestamps::Updated

  before_create :generate_spice
  validates_presence_of :ip

  field :ip, type: String
  field :spice, type: String

  embedded_in :user

private

  def generate_spice
    begin
      self.spice = SecureRandom.urlsafe_base64(64, false)
    end while self.class.where(spice: spice).exists?
  end

end
