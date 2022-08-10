class Order < ApplicationRecord
  belongs_to :cart 
  belongs_to :shoe

  def total_price 
    (shoe.price.to_f * quantity).round(2)
  end
end
