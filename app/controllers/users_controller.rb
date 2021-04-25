class UsersController < ApplicationController
  def index
    render json: User.offset(params[:offset] || 0).limit(10).to_json
  end

  def show
    render json: User.find(params[:id]).to_json
  end

  private
    def index_params
      permit(:offset)
    end
end
