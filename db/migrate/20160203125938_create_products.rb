class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.float   :price, default: 0.0
      t.string  :image_url
      t.integer :stock, default: 0

      t.timestamps null: false
    end
  end
end
