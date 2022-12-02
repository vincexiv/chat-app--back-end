# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "🌱 seeding"

puts "users..."
users = []
10.times do
    password = Faker::Lorem.characters(number: rand(5..15))

    users << User.create(
        email: Faker::Internet.email,
        username: Faker::Internet.username(specifier: 5..10),
        password: password,
        password_confirmation: password,
        bio: Faker::Lorem.paragraph(sentence_count: rand(1..5)),
        profile_picture: Faker::Avatar.image
    )
end

puts "messages..."
messages = []
50.times do
    messages << Message.create(
        content: Faker::Lorem.paragraph(sentence_count: rand(1..7)),
        sender: users.sample.id,
        receiver: users.sample.id
    )
end