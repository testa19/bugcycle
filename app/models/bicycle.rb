class Bicycle < ApplicationRecord
  belongs_to :category # , optional: true
  has_one :commit, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :pic,  dependent: :destroy
  has_many :liked_by, through: :likes, source: :user
  has_one :user, through: :commit

  validates :name, uniqueness: true, presence: true

  before_save { name.downcase! } 
  # than capitilise if needed or we can store original name in attribute 
  # like: attr_accessor :oname... oname = name; name.downcase!
end
