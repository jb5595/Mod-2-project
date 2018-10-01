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

destination1 = Destination.create(name:"Bali", description:"white sand beaches", region: "SEA")
destination2 = Destination.create(name:"Saigon", description:"Scooter City", region: "SEA")
destination3 = Destination.create(name:"Reyjavik", description:"Icelandic Capital", region: "Europe")

user1 = User.create(first_name: "Jake", last_name: "berman", user_name: "jb5595", bio:"travel")
user2 = User.create(first_name: "John", last_name: "smith", user_name: "JohnSmith", bio:"travel")
user3 = User.create(first_name: "Jane", last_name: "Doe", user_name: "JaneDoe", bio:"travel")


itinerary1 = Itinerary.new(name:"Euro Trip", budget_category: "expensive", duration: "2 weeks")
itinerary2 = Itinerary.new(name:"SEA Adventure", budget_category: "Cheap", duration: "4 weeks")
user1.itineraries << itinerary1
user2.itineraries << itinerary2
# itinerary1.save
# itinerary2.save


itinerary1.destinations << destination3
itinerary2.destinations << [destination1, destination2]

itinerary1.save
itinerary2.save
