ActiveAdmin.register GameInfo do

  index do
    selectable_column

    id_column

    column :my_team_logo do |game_info|
      image_tag game_info.my_team_logo, size: 8*8
    end
    column :opponent_team_logo do |game_info|
      image_tag game_info.opponent_team_logo, size: 8*8
    end
    column :my_team_score
    column :opponent_team_score

    actions
  end

  form do |f|
    f.inputs do
      f.input :my_team_logo, as: :file
      f.input :opponent_team_logo, as: :file
      f.input :my_team_score
      f.input :opponent_team_score
    end

    f.actions
  end

    show do
      attributes_table do
        row :my_team_logo do |game_info|
          image_tag game_info.my_team_logo
        end
        row :opponent_team_logo do |game_info|
          image_tag game_info.opponent_team_logo
        end
        row :my_team_score
        row :opponent_team_score
      end
    end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :my_team_logo, :opponent_team_logo, :my_team_score, :opponent_team_score
  #
  # or
  #
  # permit_params do
  #   permitted = [:my_team_logo, :opponent_team_logo, :my_team_score, :opponent_team_score]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
