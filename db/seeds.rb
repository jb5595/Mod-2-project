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

destination1 = Destination.create(name:"Bali", description:"white sand beaches", region: "SEA", picture_url:"https://cdn.tutsplus.com/net/uploads/legacy/958_placeholders/placehold.gif")
destination2 = Destination.create(name:"Saigon", description:"Scooter City", region: "SEA",picture_url:"https://cdn.tutsplus.com/net/uploads/legacy/958_placeholders/placehold.gif")
destination3 = Destination.create(name:"Reyjavik", description:"Icelandic Capital", region: "Europe",picture_url:"https://cdn.tutsplus.com/net/uploads/legacy/958_placeholders/placehold.gif")

user1 = User.create(first_name: "Jake", last_name: "berman", user_name: "jb5595", bio:"travel", password: "password", profile_pic:"https://cdn.tutsplus.com/net/uploads/legacy/958_placeholders/placehold.gif")
user2 = User.create(first_name: "John", last_name: "smith", user_name: "JohnSmith", bio:"travel", password: "password",profile_pic:"https://cdn.tutsplus.com/net/uploads/legacy/958_placeholders/placehold.gif")
user3 = User.create(first_name: "Jane", last_name: "Doe", user_name: "JaneDoe", bio:"travel", password: "password", profile_pic:"https://cdn.tutsplus.com/net/uploads/legacy/958_placeholders/placehold.gif")


itinerary1 = Itinerary.new(name:"Euro Trip", budget_category: "> $150/Day", duration: "2 weeks")
itinerary2 = Itinerary.new(name:"SEA Adventure", budget_category: "< $30/Day", duration: "4 weeks")
itinerary3 = Itinerary.new(name: "Foodie Trip",budget_category: "$75-150/Day", duration: "1 week")
itinerary4 = Itinerary.new(name: "US Road Trip",budget_category: "$30-75/Day", duration: "1 week")

user1.itineraries << itinerary1
user2.itineraries << itinerary2
user2.itineraries << itinerary3
user3.itineraries << itinerary4



itinerary1.destinations << destination3
itinerary2.destinations << [destination1, destination2]

itinerary1.save
itinerary2.save

user1.follow(user2)
user1.follow(user3)
user2.follow(user1)
user3.follow(user1)
