# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Home.create!(name: "Blue Cross", password_digest: "blue", user: false)
Adopter.create!(name: "Tom Rowson", password_digest: "tomspassword", location: "E2 0SU", admin: true)