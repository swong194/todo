class Task < ApplicationRecord
  belongs_to :board
  belongs_to :category
  belongs_to :user
  belongs_to :assignee, foreign_key: :asignee_id, class_name: "User", optional: true

  validates :user_id, :title, :description, :board_id, :category_id, :due_date, presence: true
end