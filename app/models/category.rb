class Category < ApplicationRecord
  has_many :bicycles

  validates :name, uniqueness: true, presence: true
end
