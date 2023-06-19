# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[update]

  # GET /orders
  def index
    @orders = Order.includes(:items).where(state: 0)
  end

  # PATCH /orders/:id
  def update
    @order.update(order_params)

    redirect_to orders_path
  end

  private

  # Set the order based on the provided order ID
  def set_order
    @order = Order.find(params[:id])
  end

  # Define the permitted parameters for updating an order
  def order_params
    params.require(:order).permit(:state)
  end
end
