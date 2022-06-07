class ReservationsController < ApplicationController
 

  def new
    @reservation = Reservation.new
    @menus = Menu.where(is_publish: true)
  end

  def create
    
     reservation = Reservation.create(permit_params)
  
     menu_quantity = params[:menu_quantity]
  
     params[:menu_ids].each_with_index do |id, index|
      if id != ""
        reservation.reservation_menus.create(menu_id: id, quantity: menu_quantity[index]) 
      end
     end
        redirect_to reservation_path(reservation)
  end

    def show
      
    end


  private
  def permit_params
    params.require(:reservation).permit(:user_id, :date, :time, :adult, :child).merge(user_id: current_user.id)
  end

end
