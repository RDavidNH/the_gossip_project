class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :email, presence: true
  validates :age, presence:true
  validates :city, presence:true

  belongs_to :city
  has_many :gossips
end
