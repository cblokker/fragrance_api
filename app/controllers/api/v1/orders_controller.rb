class Api::V1::OrdersController < ApplicationController

  # POST /orders
  def create
    OrderService.new(order_params).call
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :quantity, :sales_associate, fragrance_ids: [])
  end
end