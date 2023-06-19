# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { create(:order) }

  describe 'association' do
    it { should have_many(:items) }
  end

  describe 'enums' do
    it { should define_enum_for(:state).with_values(OPEN: 0, COMPLETED: 1) }
  end

  describe '#total_price' do
    context 'when no items in the order' do
      it 'returns 0' do
        expect(order.total_price).to eq(0)
      end
    end

    context 'when items in the order' do
      let!(:item1) { create(:item, name: 'Salami', size: 'Medium', order_id: order.id) }
      let!(:item2) { create(:item, name: 'Margherita', size: 'Large', order_id: order.id, add: ['Cheese']) }

      it 'calculates the total price correctly' do
        expect(order.total_price).to eq(15.1)
      end
    end

    context 'when promotion codes and discount code present' do
      let!(:item1) { create(:item, name: 'Salami', size: 'Small', order: order) }
      let!(:item2) { create(:item, name: 'Salami', size: 'Small', order: order) }

      before do
        order.promotion_codes = ['2FOR1']
        order.discount_code = 'SAVE5'
      end

      it 'applies promotions and discount code to calculate the total price' do
        expect(order.total_price).to eq(3.99)
      end
    end
  end
end
