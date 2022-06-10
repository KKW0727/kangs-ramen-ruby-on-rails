class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0
      t.string :date
      t.string :time
      t.integer :adult
      t.integer :child

      t.timestamps
    end
  end
end
