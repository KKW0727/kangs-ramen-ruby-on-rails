class Menu < ApplicationRecord
    has_many_attached :image

    has_many :reservation_menus, dependent: :destroy
    has_many :reservation, through: :reservation_menus

    scope :published, -> {Menu.where(is_publish: true)}
    scope :unpublished, -> {Menu.where(is_publish: false)}
end
