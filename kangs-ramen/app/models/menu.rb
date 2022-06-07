class Menu < ApplicationRecord
    has_many_attached :image

    has_many :reservation_menus, dependent: :destroy
    has_many :reservation, through: :reservation_menus
end
