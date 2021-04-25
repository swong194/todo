require './test/test_helper'

RSpec.describe Board, :type => :model do
  let! (:user) { create(:user) }

  before(:each) do
    @board = Board.create(name: Faker::Superhero.name, user_id: user.id)
  end

  it "should create a board" do
    expect(@board.present?).to eq true
  end

  it "should have an author" do
    expect(@board.user.present?).to eq  true
  end
end