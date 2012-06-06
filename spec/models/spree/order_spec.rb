require 'spec_helper'

describe Spree::Order do

  let(:line_item) { Spree::LineItem.new :quantity => 1 }
  let(:option_type) { mock_model(Spree::OptionType, :name => 'Color', :presentation => 'Color') }
  let(:option_value) { mock_model(Spree::OptionValue, :name => 'Red', :presentation => 'Red', :option_type => option_type) }

  before do
    @order = Factory.build(:order)
    @variant = mock_model(Spree::Variant, :product => "product1", :price => 20.00)
    Spree::OptionValue.stub(:find).and_return(option_value)
  end

  context "adding an item with options" do

    it "should associate the options with the line item" do
      options = { option_type.id => option_value.id }
      @order.should_receive(:contains?).with(@variant).and_return( line_item )
      line_item.should_receive(:save).twice # once in the original method, another to attach the options

      @order.add_variant(@variant, 1, options)
      line_item.option_values.should == [option_value]
    end

    it "should be ok with no options included" do
      @order.add_variant(@variant, 1)
      @order.item_count.should == 1
    end

  end


end
