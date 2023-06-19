# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersHelper, type: :helper do
  describe '#format_code' do
    context 'when a code is present' do
      it 'returns the code' do
        code = '2FOR1'
        expect(helper.format_code(code)).to eq(code)
      end
    end

    context 'when a code is not present' do
      it 'returns a dash' do
        code = nil
        expect(helper.format_code(code)).to eq('-')
      end
    end
  end
end
