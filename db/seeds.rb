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

users << User.create(
        full_name: "Vincent Makokha",
        email: "vincent@example.com",
        username: "vincent",
        password: "vincent",
        password_confirmation: "vincent",
        bio: Faker::Lorem.paragraph(sentence_count: rand(1..5)),
        profile_picture: Faker::Avatar.image
    )

users << User.create(
        full_name: "Rajab Karume",
        email: "rajab@example.com",
        username: "rajab",
        password: "rajab",
        password_confirmation: "rajab",
        bio: Faker::Lorem.paragraph(sentence_count: rand(1..5)),
        profile_picture: Faker::Avatar.image
    )

users << User.create(
        full_name: "Mercy Cheruiyot",
        email: "mercy@example.com",
        username: "mercy",
        password: "mercy",
        password_confirmation: "mercy",
        bio: Faker::Lorem.paragraph(sentence_count: rand(1..5)),
        profile_picture: Faker::Avatar.image
    )

users << User.create(
        full_name: "Zablon Nyabuto",
        email: "zablon@example.com",
        username: "zablon",
        password: "zablon",
        password_confirmation: "zablon",
        bio: Faker::Lorem.paragraph(sentence_count: rand(1..5)),
        profile_picture: Faker::Avatar.image
    )

users << User.create(
        full_name: "Andrew Ochieng",
        email: "andrew@example.com",
        username: "andrew",
        password: "andrew",
        password_confirmation: "andrew",
        bio: Faker::Lorem.paragraph(sentence_count: rand(1..5)),
        profile_picture: Faker::Avatar.image
    )

puts "messages..."
messages = []
50.times do
    messages << Message.create(
        content: Faker::Lorem.paragraph(sentence_count: rand(1..7)),
        sender: users.sample.id,
        receiver: users.sample.id
    )
end