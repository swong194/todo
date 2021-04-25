require './test/test_helper'

RSpec.describe  User, :type => :model do
  it "should create a user" do
    expect { User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name )}.to change { User.count }.from(0).to(1)
  end
end
