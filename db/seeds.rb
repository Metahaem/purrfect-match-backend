# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(username: "Blue Cross", password: "blue")
User.create!(username: "Tom Rowson", password: "tomspassword", admin: true)
Adopter.create!(user_id: 2, location: "E2 0SU")
Home.create!(user_id: 1, external: true)
