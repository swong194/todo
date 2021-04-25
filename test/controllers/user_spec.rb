require './test/test_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    12.times do
      create(:user)
    end
  end
  
  describe "GET index" do
    it "should return users" do
      get :index
      expect(JSON.parse(response.body).length).to eq 10
    end
    
    it "should return users with offset" do
      get :index, params: { offset: 10 }
      expect(JSON.parse(response.body).length).to eq 2
    end
  end

  describe "GET show" do
    it "should return a user" do
      get :show, params: { id: User.last.id.to_s }
      expect(JSON.parse(response.body)["id"]).to eq User.last.id
    end
  end
end
