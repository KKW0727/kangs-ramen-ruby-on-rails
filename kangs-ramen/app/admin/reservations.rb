ActiveAdmin.register Reservation do

  scope -> {"未決済"}, :before_payment
  scope -> {"決済中"}, :processed
  scope -> {"決済完了"}, :completed
  scope -> {"決済失敗"}, :failed

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
