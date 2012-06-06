require 'spec_helper'

describe Spree::LineItem do

  it { should have_many(:option_values).through(:line_item_option_values) }

  let(:option_type)  { mock_model(Spree::OptionType, :name => 'Color', :presentation => 'Color') }
  let(:option_value) { mock_model(Spree::OptionValue, :name => 'Red', :presentation => 'Red', :option_type => option_type, :adder => 2.0) }
  let(:variant)      { mock_model(Spree::Variant, :price => 66.99) }
  let(:line_item)    { Spree::LineItem.new :quantity => 1 }
  let(:order)        { Factory.build :order }

  before do
    line_item.stub(:variant => variant, :order => order, :option_values => [option_value])
  end

  context "#options" do
    it "should return the list of option types and values" do
      line_item.options.should == [[ option_type , option_value ]]
    end
  end

  context "#price" do
    it "should include the options adders when pricing" do
      option_value.should_receive :adder
      line_item.valid?
      line_item.price.to_f.should == 68.99
    end
  end

end
