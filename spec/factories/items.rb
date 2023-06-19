# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { 'Salami' }
    size { 'Medium' }
    add { [] }
    remove { [] }
    order
  end
end
