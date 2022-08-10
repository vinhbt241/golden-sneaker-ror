class HomesController < ApplicationController
  def index 
    @shoes = Shoe.all

    @current_cart = Cart.first 
    @orders = @current_cart.orders 
    @amount = @current_cart.amount
  end

  def add_order_to_cart 
    @selected_shoe = Shoe.find(params[:shoe_id])
    current_cart = Cart.first 
    
    @order = Order.create(shoe_id: @selected_shoe.id, cart_id: current_cart.id, quantity: 1)

    @selected_shoe.selected = true 
    @selected_shoe.save!

    @amount = current_cart.amount
    @orders = current_cart.orders

    respond_to do |format|
      format.turbo_stream
    end
  end

  def remove_order_from_cart 
    @selected_shoe = Shoe.find(params[:shoe_id])
    current_cart = Cart.first 

    Order.where(shoe_id: @selected_shoe.id, cart_id: current_cart.id).destroy_all

    @selected_shoe.selected = false 
    @selected_shoe.save!

    @amount = current_cart.amount
    @orders = current_cart.orders

    respond_to do |format|
      format.turbo_stream
    end
  end

  def increase_order_quantity 
    @order = Order.find(params[:order_id])
    @order.quantity += 1
    @order.save!
    
    current_cart = Cart.first 
    @amount = current_cart.amount

    respond_to do |format|
      format.turbo_stream
    end
  end

  def decrease_order_quantity 
    @order = Order.find(params[:order_id])
    @selected_shoe = @order.shoe

    if @order.quantity == 1 
      @selected_shoe.selected = false 
      @selected_shoe.save!
      @order.destroy
    else
      @order.quantity -= 1
      @order.save! 
    end

    current_cart = Cart.first 
    @amount = current_cart.amount
    @orders = current_cart.orders

    respond_to do |format|
      format.turbo_stream
    end
  end
end
