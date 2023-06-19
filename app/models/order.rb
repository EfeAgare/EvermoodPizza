# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :items, dependent: :destroy

  enum state: {
    OPEN: 0,
    COMPLETED: 1
  }

  def total_price
    total = 0

    items.each do |item|
      total += total_unit_price(item)
    end

    total -= apply_promotions

    total = apply_discount_code(total) if discount_code.present?

    total.round(2)
  end

  private

  def total_unit_price(item)
    # Get the base price of the pizza
    base_price = ORDER_CONFIG['pizzas'][item.name]

    # Get the size multiplier
    size_multiplier = ORDER_CONFIG['size_multipliers'][item.size]

    # Calculate the price based on the size
    size_price = base_price * size_multiplier

    # Calculate the price for extra ingredients
    extras_price = item.add.sum { |ingredient| ORDER_CONFIG['ingredients'][ingredient] * size_multiplier }

    # Calculate the item price
    size_price + extras_price
  end

  def apply_promotions
    promotion_total_price = 0
    # Iterate over each promotion code in the order
    promotion_codes.each do |code|
      promotion = ORDER_CONFIG['promotions'][code]

      # Find the pizzas in the order that match the promotion's target pizza and size
      eligible_pizzas = select_items(items, promotion)

      promotion_total_price += promotion_total_price(eligible_pizzas, promotion['from'], promotion['to'],
                                                     promotion['target'], promotion['target_size'])
    end

    promotion_total_price
  end

  def apply_discount_code(price)
    discounts = ORDER_CONFIG['discounts']

    deduction_in_percent = discounts[discount_code]['deduction_in_percent']

    # Calculate the discount amount
    discount_amount = (price * deduction_in_percent).to_f / 100

    # # Apply the discount to the total price
    price -= discount_amount

    price
  end

  def promotion_total_price(eligible_pizzas, from, to, target_pizza, target_size)
    # Calculate the number of eligible pizzas after applying the promotion
    eligible_pizza_count = eligible_pizzas.size

    return 0 unless eligible_pizza_count >= from

    # Calculate the number of times to charge the promotion
    # on the pizza
    applied_promotion_times = eligible_pizza_count / from

    # Calculate the number of pizzas to be charged for,
    # after applying the promotion
    discount_number = from - to

    size_price = ORDER_CONFIG['pizzas'][target_pizza] * ORDER_CONFIG['size_multipliers'][target_size]

    (size_price * discount_number * applied_promotion_times)
  end

  def select_items(items, promotion)
    items.select do |item|
      item.name == promotion['target'] && item.size == promotion['target_size']
    end
  end
end
