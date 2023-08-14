# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get root_path

      expect(response).to have_http_status(:success)
    end

    it 'assigns the orders with state "OPEN" to @orders' do
      open_orders = create_list(:order, 3, state: 'OPEN')
      create_list(:order, 2, state: 'COMPLETED')

      get root_path

      expect(assigns(:orders)).to eq(open_orders)
    end

    it 'renders the index template' do
      get root_path

      expect(response).to render_template(:index)
    end
  end

  describe 'PATCH #update' do
    let(:order) { create(:order) }

    context 'with valid parameters' do
      it 'updates the order' do
        patch order_path(order.id), params: { id: order.id, order: { state: 'COMPLETED' } }

        expect(order.reload.state).to eq('COMPLETED')
      end

      it 'redirects to the orders index page' do
        patch order_path(order.id), params: { id: order.id, order: { state: 'COMPLETED' } }

        expect(response).to redirect_to(orders_path)
      end
    end
  end
end
