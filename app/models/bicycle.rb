class Bicycle < ApplicationRecord
  belongs_to :category
  has_one :commit, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :pic,  dependent: :destroy
  has_many :users, through: :likes
  has_one :user, through: :commit

  before_save { name.downcase! }
end
