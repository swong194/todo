class Board < ApplicationRecord
  validates :user_id, presence: true
  validates :name, presence: true
  has_many :tasks

  belongs_to :user
  has_many :categories
end
 