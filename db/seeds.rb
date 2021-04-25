# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Board.delete_all
Category.delete_all
Task.delete_all

user = User.create(first_name: "Sunny", last_name: "Wong")
board = user.boards.create(name: Faker::Superhero.name)

50.times do
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  rand(1..3).times do
    board = user.boards.create(name: Faker::Superhero.name)
    rand(1..4).times do
      category = board.categories.create(name: Faker::Superhero.name)
      rand(1..5).times do
        category.tasks.create(
          user_id: user.id,
          board_id: board.id,
          title: Faker::DcComics.hero,
          description: Faker::Lorem.paragraph,
          due_date: Time.now + rand(2..30).days
        )
      end
    end
  end
end
