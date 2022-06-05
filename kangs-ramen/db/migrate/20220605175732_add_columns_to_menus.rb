class AddColumnsToMenus < ActiveRecord::Migration[7.0]
  def change
    add_column :menus, :checked_all, :boolean, default: false
    add_column :menus, :image_ids, :boolean, default: false
  end
end
