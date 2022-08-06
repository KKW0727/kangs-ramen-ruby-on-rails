ActiveAdmin.register Reservation do
  belongs_to :user

  scope -> {"未決済"}, :before_payment
  scope -> {"決済中"}, :processed
  scope -> {"決済完了"}, :completed
  scope -> {"決済失敗"}, :failed

  index do 
    selectable_column 

    id_column

    column :status
    column :date
    column :time
    column :adult
    column :child
    column :created_at

    column "価格" do |reservation|
     number_to_currency(reservation.menu_total_price)
    end

    actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :status, :date, :time, :adult, :child
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :status, :date, :time, :adult, :child]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  
end
