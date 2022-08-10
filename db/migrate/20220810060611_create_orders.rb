class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :cart 
      t.belongs_to :shoe 
      t.integer :quantity
      t.timestamps
    end
  end
end
