class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable #,:recoverable,

  has_many :likes, dependent: :destroy
  has_one :commit, dependent: :destroy
  has_one :bicycle, through: :commit
  has_many :liked, through: :likes, source: :bicycle

  alias_attribute :name, :email
  
  def liked?(id)
    liked.exists?(id)
  end
end
