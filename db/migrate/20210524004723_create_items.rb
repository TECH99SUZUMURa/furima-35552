class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.integer :price, null: false
      t.text :text, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :estimated_shipping_date_id, null: false

      t.referencss :user, foreign_key: true

      t.timestamps
    end
  end
end
