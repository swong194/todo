class Category < ApplicationRecord
  belongs_to :board

  validates :board_id, presence: true 
  validates :name, presence: true
end