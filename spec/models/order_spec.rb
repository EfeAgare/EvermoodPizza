require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'enums' do
    it { should define_enum_for(:state).with_values(OPEN: 0, COMPLETED: 1) }
  end
end

