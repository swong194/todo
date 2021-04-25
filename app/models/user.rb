class User < ApplicationRecord
  has_many :boards
  has_many :assigned_tasks, primary_key: :asignee_id, class_name: "Task"
  has_many :tasks

  validates :first_name, presence: true
  validates :last_name, presence: true
end
