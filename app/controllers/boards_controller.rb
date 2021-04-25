class BoardsController < ApplicationController
  def index
    if index_params[:user_id].present?
      render json: User.find(index_params[:user_id]).boards.offset(index_params[:offset] || 0).limit(10).to_json
    else 
      render json: Board.offset(index_params[:offset] || 0).limit(10).to_json
    end
  end

  def show
    render json: Board.find(params[:id]).to_json
  end

  def create 
    render json: Board.create(board_params).to_json
  end

  private
    def index_params
      params.permit(:offset, :user_id)
    end

    def board_params
      params.permit(:name, :user_id)
    end
end
