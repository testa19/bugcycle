class Bicycle < ApplicationRecord
  belongs_to :category # , optional: true
  has_one :commit, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :pic,  dependent: :destroy
  has_many :liked_by, through: :likes, source: :user
  has_one :user, through: :commit

  validates :name, uniqueness: true, presence: true
  accepts_nested_attributes_for :pic

  include Filterable
  scope :category, -> (category_id) { where category_id: category_id }
  scope :user, -> (user_id) { joins(:liked_by).where(id: user_id) }

  before_save { name.downcase! if name } 
  # than capitilise if needed or we can store original name in attribute 
  # like: attr_accessor :oname... oname = name; name.downcase!
end
