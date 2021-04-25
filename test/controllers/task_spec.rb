require  './test/test_helper'

RSpec.describe TasksController, type: :controller do
  before(:each) do
    @user = create(:user, :with_a_board_and_categories)
    category = @user.boards.first.categories.first
    10.times do
      category.tasks.create(
        user_id: @user.id,
        board_id: @user.boards.first.id,
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph,
        due_date: Time.now + 5.days
      )
    end
    @another_user = create(:user)
    Task.limit(3).update_all(assignee_id: @another_user.id)
  end

  describe "GET index" do
    context "assigned" do
      it "should get a user's assigned tasks" do
        get :index, params: { user_id: @user.id, assigned: 'true' }
        expect(JSON.parse(response.body).length).to eq 0
      end

      it "should get a user's assigned tasks" do
        get :index, params: { user_id: @another_user.id, assigned: 'true' }
        expect(JSON.parse(response.body).length).to eq 3
      end
    end

    it "should get a user's authored tasks" do
      get :index, params: { user_id: @user.id }
      expect(JSON.parse(response.body).length).to eq 10
    end
  end

  describe "GET show" do
    it "should return a task" do
      get :show, params: { id: Task.last.id }
      expect(JSON.parse(response.body)["id"]).to eq Task.last.id
    end
  end

  describe "POST create" do
    it "should create a task" do
      expect {
        post :create, params: { 
          user_id: @user.id,
          board_id: @user.boards.first.id,
          title: Faker::Lorem.sentence,
          description: Faker::Lorem.paragraph,
          category_id: @user.boards.first.categories.last.id,
          due_date: Time.now + 5.days,
        }
      }.to change { Task.count }.by(1)
    end
  end

  describe "PUT update" do
    it "should update a task" do
      put :update, params: { id: Task.last.id, title: "A funny title" }
      expect(JSON.parse(response.body)["title"]).to eq "A funny title"
    end
  end
end
