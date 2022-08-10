class AddSeclectedColumnToShoe < ActiveRecord::Migration[7.0]
  def change
    add_column :shoes, :selected, :boolean, default: false
  end
end
