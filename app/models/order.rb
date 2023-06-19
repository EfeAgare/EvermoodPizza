# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :items, dependent: :destroy

  enum state: {
    OPEN: 0,
    COMPLETED: 1
  }
end
