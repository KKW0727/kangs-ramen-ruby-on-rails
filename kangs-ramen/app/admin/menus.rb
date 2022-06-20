ActiveAdmin.register Menu do

  scope -> {'すべて'}, :all
  scope -> {'公開'}, :published, default: true
  scope -> {'非公開'}, :unpublished

  controller do

    def update(options={}, &block)
       #render plain: params.inspect
       @menu = Menu.find(params[:id])

       #画像をすべて削除
       if params[:checked_all]
        @menu.image.each do |image|
          image.purge
        end
       end

       #選択された画像を削除
       if params[:image_ids]
        @images = @menu.image.where(id: params[:image_ids])
        @images.each do |image|
          image.purge
        end
        end

        super do |success, failure| 
          block.call(success, failure) if block
          failure.html { render :edit }
       end  
    end

  end


  index do
    selectable_column

    id_column

    column :image do |menu|
      if menu.image.attached?
        menu.image.each do |image|
          div do
            image_tag image, size: 12*12
          end
        end
      else
        "イメージなし"
      end
    end
    column :title

    column :description

    column :price do |menu|
      number_to_currency(menu.price)
    end

    column :is_publish

    actions

  end

  form html: {multipart: true} do |f|

    if f.object.image.attached?
      f.label :checked_all, "すべてを削除"
      f.check_box :checked_all, {name: "checked_all", checked: false}, true, false
      f.object.image.each do |image|
        span do
        image_tag image, size: 12*12
        end
        f.check_box :image_ids, {multiple: true, name: "image_ids[]"}, image.id, false
      end
    end

    f.inputs do
      f.input :image, as: :file , input_html: {multiple: true}
      file_field_tag(class: "preview")
      f.input :title
      f.input :description
      f.input :price
      f.input :is_publish
    end
      f.actions
  end

  show do 
    attributes_table do
      row :image do |menu|
        if menu.image.attached?
          menu.image.each do |image|
            div do
              image_tag image, size: 12*12
            end
          end
        else
          "イメージなし"
        end
    end
      row :title
      row :description
      row :price do |menu|
        number_to_currency(menu.price)
      end
      row :is_publish
    end
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :image, :title, :description, :price, :is_publish
  #
  # or
  #
  # permit_params do
  #   permitted = [:image, :title, :description, :price, :is_publish]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
