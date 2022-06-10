class CreateReservationMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :reservation_menus do |t|
      t.references :reservation, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
