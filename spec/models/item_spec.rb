require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'association' do
    it { should belong_to(:order) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:size) }
  end
end

