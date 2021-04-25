class CategoriesController < ApplicationController
  def index
    if index_params[:board_id]
      render json: Board.find(params[:board_id]).categories.to_json
    end
  end

  def show
    render json: Category.find(params[:id]).to_json
  end

  def create
    render json: Category.create(category_params).to_json
  end

  private
    def index_params
      params.permit(:board_id)
    end
    
    def category_params
      params.permit(:board_id, :name)
    end
end
