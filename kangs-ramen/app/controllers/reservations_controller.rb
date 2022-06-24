class ReservationsController < ApplicationController
 
  def index
      @reservations = Reservation.where(user_id: current_user.id)
  end

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
       @reservation = Reservation.find(params[:id])
    end

    def destroy
      reservation = Reservation.find(params[:id])

      Stripe.api_key = "sk_test_51K7ZqTJZ9QJfM1Qbsp1OEHxk2zRr9rtMlFONRtzYWGywRyFESIptlPPWgYJKgj7HYLNYBo9K7TgwLOlevERpIt1J00JE56qjDn"
       if reservation.payment.present?
      refund = Stripe::Refund.create({
            charge: reservation.payment.stripeToken
      });

       if refund[:status] == "succeeded"
          #キャンセル成功の時、予約状況を変更
          reservation.update(status: :キャンセル)
          #キャンセルされた予約をstripeTokenで区別(nilの場合->キャンセルされた予約)
          reservation.payment.update(stripeToken: nil)
       end
      
      else
       reservation.update(status: :キャンセル)
      end
        flash[:notice] = "予約と決済をキャンセルしました。"

        redirect_to reservations_path
    end


  private
  def permit_params
    params.require(:reservation).permit(:user_id, :date, :time, :adult, :child).merge(user_id: current_user.id)
  end

end
