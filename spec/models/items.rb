***spec/models/items_spec.rb***

require 'rails_helper'

RSpec.describe Item, type: :model do
  it "has a valid factory" do
    item = build(:item)
    expect(item).to be_valid
  end
end
