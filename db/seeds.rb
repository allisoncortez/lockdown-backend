# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Player.destroy_all
Game.destroy_all


alice = Player.create(name: "Alice")
sal = Player.create(name: "SalStaysHome")
queen = Player.create(name: "QuarantineQueen5000")

Game.create([
    {player_id: 1, score: 1200},
    {player_id: 2, score: 1800},
    {player_id: 3, score: 500}
  ]);