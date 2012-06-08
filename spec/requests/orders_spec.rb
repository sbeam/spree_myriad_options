require 'spec_helper'

describe 'orders' do

  let(:option_type)  { build(:option_type, :name => 'lug-finish', :presentation => 'Wheel Lug Finish') }
  let(:option_value) { build(:option_value, :name => 'metal-umber', :presentation => 'Metallic Umber', :option_type => option_type, :adder => 3.05) }
  let(:product) { create(:product, :name => 'spree hot rod', :on_hand => 5, :price => 19.99) }
  let(:order) { create(:order, :shipping_method => create(:shipping_method)) }

  before do
    order.add_variant(product.master, 2, [option_value])
    visit spree.order_path(order)
  end

  it "shows the line item options" do
    page.should have_content(option_type.presentation)
    page.should have_content(option_value.presentation)
    page.should have_content(product.price + option_value.adder)
  end

end
