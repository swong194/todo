require './test/test_helper'

RSpec.describe BoardsController, type: :controller do
  before(:each) do
    @user = create(:user)
    12.times do
      @user.boards.create(name: Faker::Superhero.name)
    end
    create(:user, :with_a_board)
  end

  describe "GET index" do
    it "should return a user's boards" do
      get :index, params: { user_id: User.last.id }
      expect(JSON.parse(response.body).length).to eq 1
    end

    it "should get boards with offset" do
      get :index, params: { offset: 10 }
      expect(JSON.parse(response.body).length < 10).to eq true 
    end
  end

  describe "GET show" do
    it "should return a board" do
      get :show, params: { id: Board.last.id.to_s }
      expect(JSON.parse(response.body)["id"]).to eq Board.last.id
    end
  end

  describe "POST create" do
    it "should create a board" do
      expect {
        post :create, params: { user_id: User.first.id, name: Faker::Superhero.name }
      }.to change { Board.count }.by(1)
    end
  end
end