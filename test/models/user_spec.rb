require './test/test_helper'

RSpec.describe User, :type => :model do
  it "should create a user" do
    expect { 
      User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name 
      )
    }.to change { User.count }.from(0).to(1)
  end

  describe "Boards" do
    let!(:user) { create(:user) }

    it "should let a user create a board" do
      board = user.boards.create(name: Faker::Superhero.name)
      expect(board.present?).to eq true
    end
  end
end
