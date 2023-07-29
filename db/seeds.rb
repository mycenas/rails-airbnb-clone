# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# seed quests

dm1 = User.create(email:"dm1@dm.com", username: 'DungeonMaster1', password: "123456", role: "role1")
dm2 = User.create(email: "dm2@dm.com", username: 'DungeonMaster2', password: "abcdefg", role: "role2")

quest11 = Quest.create!(name: "Mysterious Monolith", description: "Investigate the ancient monolith", requirement: "History and magic knowledge", location: "Old Ruins", reward: 500, user: dm1)
puts "Created quest #{quest11.name} with id #{quest11.id}"

quest12 = Quest.create!(name: "The Underwater Cave", description: "Recover the lost treasure", requirement: "Swimming skills", location: "Coastal cave", reward: 600, user: dm2)
puts "Created quest #{quest12.name} with id #{quest12.id}"

quest13 = Quest.create!(name: "Cursed Forest", description: "Lift the curse from the forest", requirement: "Magical abilities", location: "Cursed Forest", reward: 700, user: dm1)
puts "Created quest #{quest13.name} with id #{quest13.id}"

quest14 = Quest.create!(name: "Vampire Hunt", description: "Eliminate the vampire lord", requirement: "Strong combatant", location: "Castle ruins", reward: 400, user: dm2)
puts "Created quest #{quest14.name} with id #{quest14.id}"

quest15 = Quest.create!(name: "Rescue Mission", description: "Rescue the princess from ogres", requirement: "Stealth", location: "Ogre Cave", reward: 500, user: dm1)
puts "Created quest #{quest15.name} with id #{quest15.id}"

quest16 = Quest.create!(name: "The Ghost Ship", description: "Investigate the haunted ship", requirement: "Bravery", location: "Haunted Harbor", reward: 800, user: dm2)
puts "Created quest #{quest16.name} with id #{quest16.id}"

quest17 = Quest.create!(name: "Treasure of the Sands", description: "Find the desert treasure", requirement: "Survival skills", location: "Desert Ruins", reward: 900, user: dm1)
puts "Created quest #{quest17.name} with id #{quest17.id}"

quest18 = Quest.create!(name: "The Forgotten Temple", description: "Explore the ancient temple", requirement: "Puzzle solving", location: "Jungle Temple", reward: 1000, user: dm2)
puts "Created quest #{quest18.name} with id #{quest18.id}"

quest19 = Quest.create!(name: "Pirate's Booty", description: "Retrieve the stolen treasure", requirement: "Strong fighter", location: "Pirate Cove", reward: 650, user: dm1)
puts "Created quest #{quest19.name} with id #{quest19.id}"

quest20 = Quest.create!(name: "The Wizard's Tower", description: "Assist in magical experiments", requirement: "Magical knowledge", location: "Wizard's Tower", reward: 700, user: dm2)
puts "Created quest #{quest20.name} with id #{quest20.id}"
