FactoryBot.define do
  factory :task do
    title { Faker::DcComics.title }
    description { Faker::Lorem.paragraph }
    due_date { Time.now + 7.days }

    transient do
      user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
      board = user.boards.create(name: Faker::Superhero.name) 
      category = board.categories.create(name: Faker::Superhero.name) 
      user_id { user.id }
      board_id { board.id }
      category_id { category.id }
      assignee_id { nil }
    end

    before(:create) do |task, evaluator|
      Task.update(
        user_id: evaluator.user_id,
        board_id: evaluator.board_id,
        category_id: evaluator.category_id,
        assignee_id: evaluator.assignee_id
      )
    end
  end
end