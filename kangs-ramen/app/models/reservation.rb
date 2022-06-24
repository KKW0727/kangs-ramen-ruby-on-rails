class Reservation < ApplicationRecord
  belongs_to :user

  enum status: [:未決済, :決済中, :完了, :失敗, :キャンセル]

  scope :before_payment, ->{Reservation.where(status:0)}
  scope :processed, ->{Reservation.where(status:1)}
  scope :completed, -> {Reservation.where(status: 2)}
  scope :failed, ->{Reservation.where(status:3)}

  has_many :reservation_menus, dependent: :destroy
  has_many :menus, through: :reservation_menus

  has_one :payment,  dependent: :nullify

  def menu_total_price 
    menu_total_price = 0
    self.reservation_menus.each do |reservation_menu|
      menu_total_price += reservation_menu.menu.price * reservation_menu.quantity
    end
    return menu_total_price
  end 
  
end