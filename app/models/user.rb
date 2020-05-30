class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :days
  scope :authorized_users, -> { where(is_authorized: true) }
  scope :unauthorized_users, -> { where(is_authorized: false) }

  default_scope { where(creator: false) }

  def name
    "#{first_name} #{last_name}"
  end
end
