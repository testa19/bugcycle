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
  scope :user, -> (user_id) { joins(:liked_by).where(users: {id: user}) }
  scope :uncommitted, -> (user_id) { joins(:user).where.not(users: {id: user_id}) }

  before_save { name.downcase! if name } 

  def self.search(query)
    where('name LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%")
  end

  def self.search_uncommitted(committed_id, query)
    uncommitted(committed_id).search(query)
  end
  # than capitilise if needed or we can store original name in attribute 
  # like: attr_accessor :oname... oname = name; name.downcase!
end
