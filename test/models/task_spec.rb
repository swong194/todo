require './test/test_helper'

RSpec.describe Task, :type => :model do
  let!(:user) { create(:user, :with_a_board_and_categories, category_count: 5) }
  let!(:another_user) { create(:user) }
  
  it "should create a task" do
    category = user.boards.first.categories.first
    expect {
      category.tasks.create(
        board_id: user.boards.first.id,
        user_id: user.id,
        title: Faker::DcComics.title, 
        description: Faker::Lorem.paragraph, 
        due_date: Time.now + 5.days
      )
  }.to change { Task.count }.by(1)
  end

  it "should have a board" do
    
  end
end
