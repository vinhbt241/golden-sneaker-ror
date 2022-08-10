class CreateShoes < ActiveRecord::Migration[7.0]
  def change
    create_table :shoes do |t|
      t.string :image 
      t.string :name 
      t.string :description 
      t.string :price 
      t.string :color
      t.timestamps
    end
  end
end
