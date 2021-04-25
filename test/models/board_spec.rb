require './test/test_helper'

RSpec.describe Board, :type => :model do
  let! (:user) { create(:user) }

  before(:each) do
    @board = Board.create(name: Faker::Superhero.name, user_id: user.id)
  end

  it "should create a board" do
    expect { 
      Board.create(name: Faker::Superhero.name, user_id: user.id) 
    }.to change { Board.count }.by(1)
  end

  it "should have an author" do
    expect(@board.user.present?).to eq true
  end

  it "should have categories" do
    expect {
      @board.categories.create(name: Faker::Superhero.name) 
    }.to change { Category.count }.by(1)
    expect(@board.categories.first).to eq Category.first
  end
end