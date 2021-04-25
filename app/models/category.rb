class Category < ApplicationRecord
  belongs_to :board
  has_many :tasks

  validates :board_id, presence: true 
  validates :name, presence: true
end