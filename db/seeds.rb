# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#require 'faker'

cities = []
users = []
tags = []

# fixed admin user
  city = City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )

  user = User.create(
    first_name: 'admin',
    last_name: 'admin',
    description: 'admin user',
    email: 'admin@email.com',
    password: 'adminadmin',
    age: Faker::Number.within(range: 15..70),
    city: city
  )

# create 10 users with 10 cities
10.times do |i|

  city = City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )

  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: 12),
    email: Faker::Internet.email,
    password: 'adminadmin',
    age: Faker::Number.within(range: 15..70),
    city: city
  )
  
  users << user
  
end

# create 10 tags
10.times do |i|
  tag = Tag.create(
    title: Faker::Lorem.word
  )
  
  tags << tag
end

# create 20 gossips with 1 tag and 1 comment each
20.times do |i|
  gossip = Gossip.create(
    title: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 15),
    user: users[rand(0..9)]
  )
  
  
  gossip_tag = GossipTag.create(
    gossip: gossip,
    tag: tags[rand(0..9)]
  )
  
  comment = Comment.create(
    content: Faker::Lorem.sentence(word_count: 10),
    user: users[rand(0..9)],
    gossip: gossip
  )
  
end












