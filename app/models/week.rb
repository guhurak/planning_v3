class Week < ApplicationRecord
  has_many :days, dependent: :destroy

  default_scope{order(:id)}
end
