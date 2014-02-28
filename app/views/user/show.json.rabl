object :@user

node(:id) { |user| user._id.to_s }

attributes :name, :nick, :email, :birthday, :reputation

child :avatar do
  attributes :url, :provider
end

node(:registered_via) { |user| user.provider.name}

node(:loggedin, :if => lambda { |user| current_user && user._id == current_user._id }) do |user|
  true
end

node(:finalize, :if => lambda { |user| current_user && user._id == current_user._id && user.provider.finalized }) do |user|
  true
end
