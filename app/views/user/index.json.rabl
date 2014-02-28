collection :@users

node(:id) { |user| user._id.to_s }

attributes :name, :nick, :email, :reputation

child :avatar do
  attributes :url, :provider
end
