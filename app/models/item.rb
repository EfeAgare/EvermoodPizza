class Item < ApplicationRecord
  belongs_to :order

  validates :name, :size, presence: true
end
