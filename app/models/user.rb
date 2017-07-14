class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :likes, dependent: :destroy
  has_one :commit, dependent: :destroy
  has_one :bicycle, through: :commit
  has_many :bicycles, through: :likes
end
