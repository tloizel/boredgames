# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'creating seed db'

fabien = User.create!( {name: 'Fabien', email: 'fabien@gmail.com', password: '123456', password_confirmation: '123456'} )
david = User.create!( {name: 'David', email: 'david@gmail.com', password: '123456', password_confirmation: '123456'} )
thomas = User.create!( {name: 'Thomas', email: 'thomas@gmail.com', password: '123456', password_confirmation: '123456'} )

p 'Users created!'

sevenWonders = Offer.create!( {user_id: 1, game_name: '7 Wonders', description: 'great game', price: 20, game_condition: 'As new', location: 'Paris', delivery_type: 'Colissimo', language: 'French', active: true} )
monopoly = Offer.create!( {user_id: 2, game_name: 'Monopoly', description: 'I hate this game and want to sell it',price: 5,  game_condition: 'Good condition', location: 'Lille', delivery_type: 'In-person', language: 'French', active: true} )
scythe = Offer.create!( {user_id: 3, game_name: 'Scythe', description: "don't understand this game", price: 35, game_condition: 'Poor', location: 'London', delivery_type: 'In-person', language: 'English', active: true} )
wingspan = Offer.create!( {user_id: 3, game_name: 'Wingspan', description: "beautiful game but I don't like birds", price: 40, game_condition: 'Used', location: 'London', delivery_type: ['Colissimo', 'In-person'], language: 'English', active: false} )

p 'offers created!'

wingspan_transaction = Transaction.create!( { offer_id: 4, user_id: 1, rating: 2, chosen_delivery: 'In-person'} )

p 'transactions created!'

p 'seed db done :)'
