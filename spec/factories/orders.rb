# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    state { 0 }
    discount_code { nil }
    promotion_codes { [] }
  end
end
