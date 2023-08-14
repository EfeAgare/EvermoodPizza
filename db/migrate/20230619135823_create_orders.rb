# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.integer :state, default: 0
      t.string :discount_code
      t.string :promotion_codes, array: true, default: []

      t.timestamps
    end
  end
end
