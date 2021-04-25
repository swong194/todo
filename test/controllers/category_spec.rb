require './test/test_helper'

RSpec.describe CategoriesController, type: :controller do
  before(:each) do 
    @user = create(:user, :with_a_board_and_categories)
    @another_user = create(:user, :with_a_board)
  end

  describe "GET index" do
    it "should return a board's categories" do
      get :index, params: { board_id: @user.boards.first.id }
      expect(JSON.parse(response.body).length).to eq @user.boards.first.categories.count
    end
  end

  describe "GET show" do
    it "should return a category" do
      get :show, params: { id: Category.last.id }
      expect(JSON.parse(response.body)["id"]).to eq Category.last.id
    end
  end

  describe "POST create" do
    it "should create a category" do
      expect  {
        post :create, params: { board_id: @another_user.boards.first.id, name: Faker::Superhero.name }
      }.to change { @another_user.boards.first.categories.count }.by(1)
    end
  end
end
