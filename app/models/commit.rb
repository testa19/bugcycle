class Commit < ApplicationRecord
  belongs_to :bicycle
  belongs_to :user

  validates_uniqueness_of :user_id, :bicycle_id
end
