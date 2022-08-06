ActiveAdmin.register User do

  index do 
    selectable_column 

    id_column

    column :email

    column :created_at

    column "予約" do |user|
      if user.reservations.blank?
        div "なし"
      elsif
        a "#{user.reservations.size}件を見る", href: "/admin/users/#{user.id}/reservations"
      end
    end

    column "レビュー" do |user|
      if user.reviews.blank?
        div "なし"
      elsif
      a "#{user.reviews.size}件を見る", href: "/admin/users/#{user.id}/reviews"
      end
    end

    actions

  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phone, :address
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phone, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
