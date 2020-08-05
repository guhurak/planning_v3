class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :days
  scope :authorized_users, -> { where(is_authorized: true, creator: false) }
  scope :unauthorized_users, -> { where(is_authorized: false, creator: false) }
  after_create :create_days

  def name
    "#{first_name} #{last_name}"
  end

  private
  
    def create_days
      weeks = Week.all
      weeks.each do |week|
        week.days.create(user_id: id)
      end
    end
end
