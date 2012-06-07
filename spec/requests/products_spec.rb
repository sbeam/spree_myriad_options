require 'spec_helper'

describe "Product detail page" do
    before do
      taxon = FactoryGirl.create(:taxon, :name => 'Motorcycles')
      @product = FactoryGirl.create(:custom_product, :name => 'Custom Hot Rod', :price => '299.99', :taxons => [taxon])
      option_type = Factory(:option_type, :name => 'tank-color', :presentation => 'Tank Color')
      @option_value = Factory(:option_value, :name => 'red', :presentation => 'Red', :option_type => option_type, :adder => 3.05)
      @product.option_types << option_type
    end

    context "in the add to cart form" do
      before do
        visit spree.product_path(@product)
      end

      it "should show the products option type" do
        page.should have_content(@product.option_types.first.presentation)
      end

      it "should show the products option values" do
        find('.product-option-type').should have_content(@option_value.presentation)
      end

      it "should have a selector for the option value" do
        find('.product-option-type li').should have_css(%Q|input[type=radio][value="#{@option_value.id}"]|)
      end

      context "after adding to cart" do
        before do
          choose 'Red'
          click_button 'Add To Cart'
        end

        it "should go to the shopping cart" do
          page.should have_content 'Shopping Cart'
        end

        it "should show the product" do
          page.should have_content @product.name
          page.should have_content @product.price + @option_value.adder
        end

      end

    end
end
