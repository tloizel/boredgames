# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Cleaning seed...'

Purchase.all.destroy_all
Offer.all.destroy_all
User.all.destroy_all

p 'Seed clean!'

p 'Creating seed db'

fabien = User.create!( {name: 'Fabien', email: 'fabien@gmail.com', password: '123456', password_confirmation: '123456'} )
david = User.create!( {name: 'David', email: 'david@gmail.com', password: '123456', password_confirmation: '123456'} )
thomas = User.create!( {name: 'Thomas', email: 'thomas@gmail.com', password: '123456', password_confirmation: '123456'} )

p 'Users created!'

sevenWonders = Offer.create!( {user_id: fabien.id, game_name: '7 Wonders', description: 'great game', price: 20, game_condition: 'As new', location: 'Paris', delivery_type: ['Colissimo'], language: 'French', active: true} )
sevenWonders_first = {io: File.open('Seed_images/7-wonders-Asmodee.jpg'), filename: '7_wonders_first_photo'}
sevenWonders_second = {io: File.open('Seed_images/7-wonders-jeu-de-strategie.jpg'), filename: '7_wonders_second_photo'}
sevenWonders.photos.attach([sevenWonders_first, sevenWonders_second])

p 'Seven Wonders created!'

monopoly = Offer.create!( {user_id: david.id, game_name: 'Monopoly', description: 'I hate this game and want to sell it', price: 5,  game_condition: 'Good condition', location: 'Lille', delivery_type: ['In person', 'Colissimo'], language: 'French', active: true} )
monopoly_first = {io: File.open('Seed_images/monopoly_1.jpg'), filename: 'monopoly_first_photo'}
monopoly_second = {io: File.open('Seed_images/monopoly_2.jpg'), filename: 'monopoly_second_photo'}
monopoly.photos.attach([monopoly_first, monopoly_second])

p 'Monopoly created!'

scythe = Offer.create!( {user_id: thomas.id, game_name: 'Scythe', description: "don't understand this game", price: 35, game_condition: 'Poor', location: 'London', delivery_type: ['In person', 'Colissimo'], language: 'English', active: true} )
scythe_first = {io: File.open('Seed_images/scythe_1.jpg'), filename: 'scythe_first_photo'}
scythe_second = {io: File.open('Seed_images/Scythe_2.jpg'), filename: 'scythe_second_photo'}
scythe.photos.attach([scythe_first, scythe_second])

p 'Scythe created!'

wingspan = Offer.create!( {user_id: fabien.id, game_name: 'Wingspan', description: "beautiful game but I don't like birds", price: 40, game_condition: 'Used', location: 'London', delivery_type: ['Colissimo', 'In person'], language: 'English', active: false} )
wingspan_first = {io: File.open('Seed_images/wingspan_1.jpg'), filename: 'wingspan_first_photo'}
wingspan_second = {io: File.open('Seed_images/wingspan_2.jpg'), filename: 'wingspan_second_photo'}
wingspan.photos.attach([wingspan_first, wingspan_second])

p 'Wingspan created!'

chess = Offer.create!( {user_id: thomas.id, game_name: 'Chess', description: "loved the series, not the game", price: 10, game_condition: 'As new', location: 'Lyon', delivery_type: ['Colissimo', 'In person'], language: 'Russian', active: true} )
chess_first = {io: File.open('Seed_images/chess1.jpeg'), filename: 'chess_first_photo'}
chess_second = {io: File.open('Seed_images/chess2.jpeg'), filename: 'chess_second_photo'}
chess.photos.attach([chess_first, chess_second])

p 'Chess created!'

carcassonne = Offer.create!( {user_id: fabien.id, game_name: 'Carcassonne', description: "Great game to play as a family, suitable for all ages", price: 15, game_condition: 'Poor', location: 'Glasgow', delivery_type: ['Colissimo', 'In person'], language: 'English', active: true} )
carcassonne_first = {io: File.open('Seed_images/carca1.jpeg'), filename: 'carca_first_photo'}
carcassonne_second = {io: File.open('Seed_images/carca2.jpeg'), filename: 'carca_second_photo'}
carcassonne.photos.attach([carcassonne_first, carcassonne_second])

p 'Carcassonne created!'

ticket = Offer.create!( {user_id: david.id, game_name: 'Ticket To Ride', description: "Got this game twice for Christmas, brand new", price: 50, game_condition: 'As new', location: 'London', delivery_type: ['Colissimo', 'In person'], language: 'English', active: true} )
ticket_first = {io: File.open('Seed_images/ticket1.jpg'), filename: 'carca_first_photo'}
ticket_second = {io: File.open('Seed_images/ticket2.jpeg'), filename: 'carca_second_photo'}
ticket.photos.attach([ticket_first, ticket_second])

p 'TicketToRide created!'

dixit = Offer.create!( {user_id: thomas.id, game_name: 'Dixit', description: "I know the cards off by heart, tell to sell", price: 10, game_condition: 'Poor', location: 'London', delivery_type: ['Colissimo', 'In person'], language: 'English', active: true} )
dixit_first1 = {io: File.open('Seed_images/dixit1.jpeg'), filename: 'dixit_first_photo'}
dixit_second1 = {io: File.open('Seed_images/dixit4.jpeg'), filename: 'dixit_second_photo'}
dixit.photos.attach([dixit_first1, dixit_second1])

p 'Dixit1 created!'

dixit = Offer.create!( {user_id: fabien.id, game_name: 'Dixit', description: "I have a newer version of the game", price: 20, game_condition: 'Used', location: 'Paris', delivery_type: ['Colissimo', 'In person'], language: 'French', active: true} )
dixit_first2 = {io: File.open('Seed_images/dixit2.jpg'), filename: 'dixit_first_photo'}
dixit_second2 = {io: File.open('Seed_images/dixit5.jpeg'), filename: 'dixit_second_photo'}
dixit.photos.attach([dixit_first2, dixit_second2])

p 'Dixit2 created!'

dorado = Offer.create!( {user_id: fabien.id, game_name: 'El Dorado', description: "Lovely deck-building game", price: 30, game_condition: 'Good condition', location: 'Paris', delivery_type: ['In person'], language: 'French', active: true} )
dorado_first = {io: File.open('Seed_images/dorado1.jpg'), filename: 'dorado_first_photo'}
dorado_second = {io: File.open('Seed_images/dorado2.jpeg'), filename: 'dorado_second_photo'}
dorado.photos.attach([dorado_first, dorado_second])

p 'Dorado created!'

ile = Offer.create!( {user_id: fabien.id, game_name: 'Ile of Skye', description: "A sort of Carcassonne 2.0, this game is woth playing!", price: 20, game_condition: 'Used', location: 'Nottingham', delivery_type: ['Colissimo', 'In person'], language: 'English', active: true} )
ile_first = {io: File.open('Seed_images/ile1.jpeg'), filename: 'ile_first_photo'}
ile_second = {io: File.open('Seed_images/ile2.jpeg'), filename: 'ile_second_photo'}
ile.photos.attach([ile_first, ile_second])

p 'Ile of Skye created!'

dixit = Offer.create!( {user_id: david.id, game_name: 'Dixit', description: "Simple but fun game to play with up to 5 players", price: 20, game_condition: 'Good condition', location: 'Paris', delivery_type: ['Colissimo', 'In person'], language: 'French', active: true} )
dixit_first3 = {io: File.open('Seed_images/dixit3.jpeg'), filename: 'dixit_first_photo'}
dixit_second3 = {io: File.open('Seed_images/dixit6.jpeg'), filename: 'dixit_second_photo'}
dixit.photos.attach([dixit_first3, dixit_second3])

p 'Dixit3 created!'

p 'All offers have been created!'

wingspan_purchase = Purchase.create!( { offer_id: Offer.first.id, user_id: fabien.id, chosen_delivery: "Colissimo"} )

p 'Purchases created!'

p 'seed db done :)'
