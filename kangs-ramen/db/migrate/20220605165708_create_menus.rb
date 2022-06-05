class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :image
      t.string :title
      t.string :description
      t.decimal :price
      t.boolean :is_publish, default: true

      t.timestamps
    end
  end
end
