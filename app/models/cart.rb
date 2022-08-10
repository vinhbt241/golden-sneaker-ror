class Cart < ApplicationRecord
  has_many :orders 
  has_many :shoes, through: :orders

  def amount 
    total_amount = 0.00

    orders.each do |order| 
      total_amount += order.total_price
    end

    return total_amount
  end
end
