require './test/test_helper'

RSpec.describe Category, :type => :model do
  let! (:user) { create(:user, :with_a_board) }

  before(:each) do
    @board = user.boards.first
  end

  it "should create a category" do
    expect { @board.categories.create(name: Faker::SuperHero.name )}
  end

  it "should have a board" do
    expect(@board.present?).to eq true
  end
end
