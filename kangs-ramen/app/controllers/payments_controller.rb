class PaymentsController < ApplicationController

    def create
        reservation = Reservation.find(params[:reservation_id])
        notice = ""
            
        Stripe.api_key = "sk_test_51K7ZqTJZ9QJfM1Qbsp1OEHxk2zRr9rtMlFONRtzYWGywRyFESIptlPPWgYJKgj7HYLNYBo9K7TgwLOlevERpIt1J00JE56qjDn"
        charge = Stripe::Charge.create({
            amount: params[:amount],
            currency: "jpy",
            source: params[:stripeToken]
        });

        if charge[:status] == "succeeded"
            Payment.create(
                reservation_id: reservation.id,
                response: charge,
                stripeToken: charge[:id],
                amount: charge[:amount]
            )

            reservation.completed!
            notice = "決済を完了しました"   

        elsif charge[:status] = "failed"

            reservation.failed!
            notice = "決済を失敗しました。"
        end
            flash[:notice] = notice
            redirect_to root_path   
    end
end
