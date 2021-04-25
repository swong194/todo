FactoryBot.define do
  factory :board do
    author_id { User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name).id }
    name { Faker::Superhero.name }
  end
end