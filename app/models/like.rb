class Like < ApplicationRecord
  belongs_to :bicycle
  belongs_to :user

  validates :user_id, uniqueness: { scope: :bicycle_id }
end
