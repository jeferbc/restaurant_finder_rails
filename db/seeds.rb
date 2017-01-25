# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.create(name: "Medellín")
City.create(name: "Bogota")
City.create(name: "Cali")
City.create(name: "Bucaramanga")
City.create(name: "Cartagena")
City.create(name: "Manizales")
City.create(name: "Barranquilla")
City.create(name: "Pereira")

# 100.times do |n|
#     Zone.create(phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, schedule: "Lunes - Domingo 12AM - 12PM", city_id: Faker::Number.between(1, 8))
# end
40.times do |m|
    restaurant = Restaurant.create(name: Faker::Name.title, img_url: "http://fakeimg.pl/250x250/", specialty: Faker::Food.spice)
    Faker::Number.number(1).to_i.times do |n|
        Zone.create(phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, schedule: "Lunes - Domingo 12AM - 12PM", city_id: Faker::Number.between(1, 8), restaurant_id: m+1)
    end
end
