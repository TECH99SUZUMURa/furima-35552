class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :postal_code,    null: false
      t.integer :prefecture_id, null: false
      t.string :manucipality,   null: false
      t.string :address,        null: false
      t.string :building_name
      t.string :phone_num,      null: false
      t.references :purchase,   null: false, foreign_key: true

      t.timestamps
    end
  end
end
