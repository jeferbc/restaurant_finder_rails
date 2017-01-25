# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.create(name: "Medellin")
City.create(name: "Bogota")
City.create(name: "Cali")
City.create(name: "Bucaramanga")
City.create(name: "Cartagena")
City.create(name: "Manizales")
City.create(name: "Barranquilla")
City.create(name: "Pereira")
Faker::Config.locale = :es

20.times do |n|
    Specialty.create(name: Faker::Food.spice)
end
# 100.times do |n|
#     Zone.create(phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, schedule: "Lunes - Domingo 12AM - 12PM", city_id: Faker::Number.between(1, 8))
# end
20.times do |n|
    Zone.create(name: Faker::Address.state ,city_id: Faker::Number.between(1, 8))
end
40.times do |m|
    restaurant = Restaurant.create(name: Faker::Food.ingredient, img_url: Faker::Avatar.image, specialty_id: Faker::Number.between(1, 20))
    Faker::Number.between(1, 10).to_i.times do |n|
        Local.create(address: Faker::Address.street_address, phone: Faker::PhoneNumber.phone_number, schedule: "Lunes - Domingo 12AM - 12PM", restaurant_id: m+1, zone_id: Faker::Number.between(1, 20))
    end
end
