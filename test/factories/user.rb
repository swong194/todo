FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end

  trait :with_a_board do 
    after(:create) do |user|
      user.boards.create(name: Faker::Superhero.name)
    end
  end
end