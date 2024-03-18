class Api::V1::OrdersController < ApplicationController

  # POST /orders
  def create
    OrderService.new(
      board_id: order_params[:board_id],
      first_name: order_params[:first_name],
      last_name: order_params[:last_name],
      quantity: order_params[:quantity],
      fragrance_ids: order_params[:fragrance_ids]
    ).call
  end

  private

  def order_params
    params.require(:order).permit(:board_id, :first_name, :last_name, :quantity, fragrance_ids: [])
  end
end
