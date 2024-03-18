class Api::V1::OrdersController < ApplicationController

  # POST /orders
  def create
    OrderService.new(order_params).call
  end

  private

  def order_params
    params.permit(:board_id, :first_name, :last_name, :quantity, fragrance_ids: [])
  end
end