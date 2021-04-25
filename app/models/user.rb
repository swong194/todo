class User < ApplicationRecord
  has_many  :boards
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end
 