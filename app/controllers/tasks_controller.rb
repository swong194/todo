class TasksController < ApplicationController
  def index
    if index_params[:user_id].present?
      if index_params[:assigned] == 'true'
        render json: User.find(index_params[:user_id]).assigned_tasks.to_json
      else
        render json: User.find(index_params[:user_id]).tasks.to_json
      end
    end
  end

  def show
    render json: Task.find(params[:id]).to_json
  end

  def create
    render json: Task.create(create_params).to_json
  end

  def update
    Task.find(params[:id]).update(update_params).to_json
    render json: Task.find(params[:id])
  end

  private
    def index_params
      params.permit(:user_id, :assigned)
    end

    def create_params
      params.permit(:user_id, :title, :description, :board_id, :category_id, :due_date, :assignee_id)
    end

    def update_params
      params.permit(:title, :description, :board_id, :category_id, :due_date, :assignee_id)
    end
end
