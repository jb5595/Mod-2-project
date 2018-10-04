# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Destination.destroy_all
Stop.destroy_all
Itinerary.destroy_all

destination1 = Destination.create(name:"Bali", description:"white sand beaches", region: "Asia", picture_url:"https://images.unsplash.com/photo-1517968724828-7f2ba6e098c3?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a91cde38edcbeddd8cc4b307279ea350&auto=format&fit=crop&w=500&q=60")
destination2 = Destination.create(name:"Saigon", description:"Scooter City", region: "Asia",picture_url:"https://images.unsplash.com/photo-1525680831739-163914d07709?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=cd92afe6599fd2917b5a606f8c4b4603&auto=format&fit=crop&w=500&q=60")
destination3 = Destination.create(name:"Reyjavik", description:"Icelandic Capital", region: "Europe",picture_url:"https://images.unsplash.com/photo-1529963183134-61a90db47eaf?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=949c13b84649441112e7991d4bc259e5&auto=format&fit=crop&w=500&q=60")
destination5 = Destination.create(name:"India", description:"One of the worlds oldest societies", region: "Asia",picture_url:"https://images.unsplash.com/photo-1524492412937-b28074a5d7da?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=073ec7f2336c9ac657f26f60ce8533f5&auto=format&fit=crop&w=500&q=60")

user1 = User.create(first_name: "Jake", last_name: "berman", user_name: "jb5595", bio:"travel", password: "password", profile_pic:"https://images.unsplash.com/photo-1470653503930-01819ee7ec83?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=47a8ff9951985e7d861f79b14905be4a&auto=format&fit=crop&w=500&q=60")
user2 = User.create(first_name: "John", last_name: "smith", user_name: "JohnSmith", bio:"travel", password: "password",profile_pic:"https://images.unsplash.com/photo-1470653503930-01819ee7ec83?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=47a8ff9951985e7d861f79b14905be4a&auto=format&fit=crop&w=500&q=60")
user3 = User.create(first_name: "Jane", last_name: "Doe", user_name: "JaneDoe", bio:"travel", password: "password", profile_pic:"https://images.unsplash.com/photo-1470653503930-01819ee7ec83?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=47a8ff9951985e7d861f79b14905be4a&auto=format&fit=crop&w=500&q=60")


itinerary1 = Itinerary.new(name:"Euro Trip", budget_category: "> $150/Day", region:"Europe" ,duration: "2 weeks", picture_url: "https://images.unsplash.com/photo-1531219432768-9f540ce91ef3?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9f841cc8d9623cc53de075ada258fed0&auto=format&fit=crop&w=500&q=60")
itinerary2 = Itinerary.new(name: "Backpacking Asia", budget_category: "< $30/Day", region: "Asia",duration: "4 weeks",picture_url: "https://images.unsplash.com/photo-1531219432768-9f540ce91ef3?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9f841cc8d9623cc53de075ada258fed0&auto=format&fit=crop&w=500&q=60")
itinerary3 = Itinerary.new(name: "Iceland Trip",budget_category: "$75-150/Day", region:"Europe" ,duration: "1 week",picture_url: "https://images.unsplash.com/photo-1531219432768-9f540ce91ef3?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9f841cc8d9623cc53de075ada258fed0&auto=format&fit=crop&w=500&q=60")
itinerary4 = Itinerary.new(name: "US Road Trip",budget_category: "$30-75/Day",region: "North America",duration: "1 week", picture_url: "https://images.unsplash.com/photo-1531219432768-9f540ce91ef3?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9f841cc8d9623cc53de075ada258fed0&auto=format&fit=crop&w=500&q=60")

user1.itineraries << itinerary1
user2.itineraries << itinerary2
user2.itineraries << itinerary3
user3.itineraries << itinerary4



itinerary1.destinations << destination3
itinerary2.destinations << [destination1, destination2, destination5]
itinerary3.destinations << destination3

itinerary1.save
itinerary2.save

user1.follow(user2)
user1.follow(user3)
user2.follow(user1)
user3.follow(user1)
