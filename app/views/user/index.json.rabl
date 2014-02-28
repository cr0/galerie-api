collection :@users
extends 'user/base'

attributes :nick, :email, :reputation

child :avatar do
  attributes :url, :provider
end

