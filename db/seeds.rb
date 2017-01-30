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
Faker::Config.locale = :es

20.times do |n|
    Specialty.create(name: Faker::Food.spice)
end
# 100.times do |n|
#     Zone.create(phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, schedule: "Lunes - Domingo 12AM - 12PM", city_id: Faker::Number.between(1, 8))
# end
zones_seed = (1..4).to_a*4
16.times do |n|
    Zone.create(name: Faker::Address.state, address: Faker::Address.unique.street_address, city_id: zones_seed[n])
end
16.times do |m|
    restaurant = Restaurant.create(name: Faker::Food.ingredient, img_url: "http://fakeimg.pl/400x200/7d848e/", specialty_id: Faker::Number.between(1, 20))
    zones_id = (1..16).to_a.shuffle
    Faker::Number.between(1, 8).to_i.times do |n|
        Local.create(phone: Faker::Base.numerify('+57 (###) ### ####'), schedule: "Lunes-Domingo 9AM-9PM", restaurant_id: m+1, zone_id: zones_id[n])
    end
end
