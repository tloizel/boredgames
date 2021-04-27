# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Creating seed db'

fabien = User.create!( {name: 'Fabien', email: 'fabien@gmail.com', password: '123456', password_confirmation: '123456'} )
david = User.create!( {name: 'David', email: 'david@gmail.com', password: '123456', password_confirmation: '123456'} )
thomas = User.create!( {name: 'Thomas', email: 'thomas@gmail.com', password: '123456', password_confirmation: '123456'} )

p 'Users created!'

sevenWonders = Offer.create!( {user_id: 1, game_name: '7 Wonders', description: 'great game', price: 20, game_condition: 'As new', location: 'Paris', delivery_type: 'Colissimo', language: 'French', active: true} )
sevenWonders_first = {io: File.open('Seed_images/7-wonders-Asmodee.jpg'), filename: '7_wonders_first_photo'}
sevenWonders_second = {io: File.open('Seed_images/7-wonders-jeu-de-strategie.jpg'), filename: '7_wonders_second_photo'}
sevenWonders.photos.attach([sevenWonders_first, sevenWonders_second])

p 'Seven Wonders created!'

monopoly = Offer.create!( {user_id: 2, game_name: 'Monopoly', description: 'I hate this game and want to sell it', price: 5,  game_condition: 'Good condition', location: 'Lille', delivery_type: 'In-person', language: 'French', active: true} )
monopoly_first = {io: File.open('Seed_images/monopoly_1.jpg'), filename: 'monopoly_first_photo'}
monopoly_second = {io: File.open('Seed_images/monopoly_2.jpg'), filename: 'monopoly_second_photo'}
monopoly.photos.attach([monopoly_first, monopoly_second])

p 'Monopoly created!'

scythe = Offer.create!( {user_id: 3, game_name: 'Scythe', description: "don't understand this game", price: 35, game_condition: 'Poor', location: 'London', delivery_type: 'In-person', language: 'English', active: true} )
scythe_first = {io: File.open('Seed_images/scythe_1.jpg'), filename: 'scythe_first_photo'}
scythe_second = {io: File.open('Seed_images/Scythe_2.jpg'), filename: 'scythe_second_photo'}
scythe.photos.attach([scythe_first, scythe_second])

p 'Scythe created!'

wingspan = Offer.create!( {user_id: 3, game_name: 'Wingspan', description: "beautiful game but I don't like birds", price: 40, game_condition: 'Used', location: 'London', delivery_type: ['Colissimo', 'In-person'], language: 'English', active: false} )
wingspan_first = {io: File.open('Seed_images/wingspan_1.jpg'), filename: 'wingspan_first_photo'}
wingspan_second = {io: File.open('Seed_images/wingspan_2.jpg'), filename: 'wingspan_second_photo'}
wingspan.photos.attach([wingspan_first, wingspan_second])

p 'Wingspan created!'

p 'All offers have been created!'

wingspan_transaction = Transaction.create!( { offer_id: 4, user_id: 1, rating: 2, chosen_delivery: 'In-person'} )

p 'Transactions created!'

p 'seed db done :)'
