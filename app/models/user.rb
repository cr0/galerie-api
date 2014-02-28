class User
  include Mongoid::Document

  validates_presence_of :name, :nick, :email, :provider, :avatar
  validates_uniqueness_of :nick, :email

  field :name, type: String
  field :nick, type: String
  field :email, type: String
  field :birthday, type: Date
  field :reputation, type: Integer, default: 0

  embeds_one :avatar
  embeds_one :provider
  embeds_many :tokens

  def self.create_with_omniauth!(auth)
    create! do |user|
      provider = Provider.new
      provider.name = auth["provider"]
      provider.uid = auth["uid"]

      avatar = Avatar.new
      case auth["provider"]
        when "facebook"
          avatar.url = %Q{https://graph.facebook.com/#{auth["uid"]}/picture?width=150&height=150}
          avatar.provider = 'facebook'
        when "google"
          avatar.url = %Q{https://plus.google.com/s2/photos/profile/#{auth["uid"]}?sz=150}
          avatar.provider = 'google'
        else
          avatar.url = Gravatar.new(auth['info']['email']).image_url
          avatar.provider = 'gravatar'
      end

      user.name = auth['info']['name']
      user.nick = auth['info']['nickname']
      user.email = auth['info']['email']
      user.birthday = auth['extra']['raw_info']['birthday']
      user.provider = provider
      user.avatar = avatar
    end
  end

  def is_finalized?
    return self.provider.finalized
  end
end
