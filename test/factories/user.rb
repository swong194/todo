FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    trait :with_a_board do 
      after(:create) do |user|
        user.boards.create(name: Faker::Superhero.name)
      end
    end
  
    transient do 
      category_count { 1 }
    end
  
    trait :with_a_board_and_categories do
      after(:create) do |user, evaluator|
        user.boards.create(name: Faker::Superhero.name)
        evaluator.category_count.times do
          user.boards.first.categories.create(name: Faker::Superhero.name)
        end
      end
    end
  end
end