# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

location = Location.new(name: 'Bayerstraße 7, 80335 München', partial: ['Bayerstraße', '7', '80335', 'München'], loc: [48.13901, 11.56687])

user = User.new
user.name = Faker::Name.name
user.nick = Faker::Name.first_name
user.email = Faker::Internet.email
user.birthday = Time.at(Time.now.to_i - rand * Time.now.to_i)
user.reputation = Faker::Address.zip
user.avatar = Avatar.new(provider: 'Gravatar', url: Faker::Internet.url)
user.provider = Provider.new(name: 'Facebook', uid: Faker::Lorem.word)
user.locations << location
user.save!
user.tokens.create(ip: Faker::Internet.ip_v4_address)

bucket = Bucket.new(name: Faker::Name.first_name, location: location)
bucket.authors << user
bucket.persons << user
bucket.tags.push(Tag.new(name: Faker::Name.name), Tag.new(name: Faker::Name.name))
bucket.save!


picture = Picture.new(name: Faker::Name.first_name, location: location, author: user)
picture.persons << user
picture.buckets << bucket
picture.tags.push(Tag.new(name: Faker::Name.name), Tag.new(name: Faker::Name.name))
picture.sources.push(PictureSource.new(name: 'mid', url: Faker::Internet.url, height: 150, width: 150), PictureSource.new(name: 'high', url: Faker::Internet.url, height: 400, width: 400))
picture.save!

picture2 = Picture.new(name: Faker::Name.first_name, location: location, author: user)
picture2.persons << user
picture2.buckets << bucket
picture2.tags.push(Tag.new(name: Faker::Name.name), Tag.new(name: Faker::Name.name))
picture2.sources.push(PictureSource.new(name: 'mid', url: Faker::Internet.url, height: 150, width: 150), PictureSource.new(name: 'high', url: Faker::Internet.url, height: 400, width: 400))
picture2.save!
