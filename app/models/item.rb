# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :order

  validates :name, :size, presence: true
end
