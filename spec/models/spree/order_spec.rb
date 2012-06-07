require 'spec_helper'

describe Spree::Order do

  let(:option_type) { mock_model(Spree::OptionType, :name => 'color', :presentation => 'Color') }
  let(:option_value) { mock_model(Spree::OptionValue, :name => 'red', :presentation => 'Red', :option_type => option_type, :adder => 2.0) }
  let(:option_value2) { mock_model(Spree::OptionValue, :name => 'blue', :presentation => 'Blue', :option_type => option_type, :adder => 0.1) }

  before do
    @order = Factory.build(:order)
    @line_item = Factory.build(:line_item, :order => @order) #let(:line_item) { Spree::LineItem.new :quantity => 1 }
    @variant = mock_model(Spree::Variant, :product => "product1", :price => 20.00)
    Spree::OptionValue.stub(:find).and_return(option_value)
  end

  context "adding an item with options" do

    it "should associate the options with the line item" do
      Spree::LineItem.stub(:new).and_return(@line_item)
      @order.stub(:contains?).and_return( false )

      @order.add_variant(@variant, 1, [option_value])
      @line_item.option_values.should == [option_value]
    end

    it "should be ok with no options included" do
      @order.add_variant(@variant, 1)
      @order.item_count.should == 1
    end

  end


  context "adding the same variant with different options" do

    it "should add two line items" do

      @order.should_receive(:contains?).with(@variant, [option_value]).and_return( @line_item )
      @order.should_receive(:contains?).with(@variant, [option_value2]).and_return( false )

      @order.add_variant(@variant, 1, [ option_value ])
      @order.add_variant(@variant, 1, [ option_value2 ])

      @order.line_items.count.should == 2
    end

  end


end
