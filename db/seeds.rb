# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

# create standard users
6.times do |n|
   name  = Faker::Name.name
   email = "standard#{n+1}@yahoo.com"
   password = "Password1"
   User.create!(name:  name,
                email: email,
                password:              password,
                password_confirmation: password,
                role: 'standard' )
end

# Create premium users
6.times do |n|
   name  = Faker::Name.name
   email = "premium#{n+1}@yahoo.com"
   password = "Password1"
   User.create!(name:  name,
                email: email,
                password:              password,
                password_confirmation: password,
                role: 'premium' )
end

# Create Admin users
name  = "Admin User"
email = "admin@yahoo.com"
password = "Password1"
User.create!(name:  name,
            email: email,
            password:              password,
            password_confirmation: password,
            role: 'admin' )

puts "Seed finished"
puts "#{User.count} users created"
puts "-----  #{User.where( role: 'standard').count}  STANDARD"
puts "-----  #{User.where( role: 'premium').count}  PREMIUM"
puts "-----  #{User.where( role: 'admin').count}  ADMIN"
