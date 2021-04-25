require './test/test_helper'

RSpec.describe User, :type => :model do
  it "should create a user" do
    expect { 
      User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name 
      )
    }.to change { User.count }.by(1)
  end

  before(:each) do
    @user = create(:user, :with_a_board_and_categories)
  end

  describe "Boards" do
    it "should let a user create a board" do
      board = @user.boards.create(name: Faker::Superhero.name)
      expect(board.present?).to eq true
    end
  end

  describe "Task" do
    it "should be able to create a task" do
      expect {
        u = @user.tasks.create(
          board_id: @user.boards.first.id,
          category_id: @user.boards.first.categories.first.id,
          title: Faker::Lorem.sentence,
          description: Faker::Lorem.paragraph,
          due_date: Time.now + 5.days
        )
      }.to change { @user.tasks.count }.by(1)
    end
  end
end
