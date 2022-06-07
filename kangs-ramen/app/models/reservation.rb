class Reservation < ApplicationRecord
  belongs_to :user

  enum status: [:before_payment, :processed, :completed, :failed]

  has_many :reservation_menus, dependent: :destroy
  has_many :menus, through: :reservation_menus
end
