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

      it "should show the adder for a given option value" do
        find("li#option_value_#{@option_value.id}").should have_content(@option_value.adder)
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

        it "should show the line item options" do
          page.should have_content @option_value.presentation
          page.should have_content @option_value.option_type.presentation
        end

      end

    end

    context "in the add to cart form with customizations" do

      before do
        @option_type = Factory(:option_type, :name => 'tank-name', :presentation => 'Name to paint on the tank')
        @customizable = Factory(:option_value, :name => 'two-lines', :presentation => 'Two Lines', :customization_lines => 2, :option_type => @option_type)
        @product.option_types << @option_type

        visit spree.product_path(@product)
      end

      it "should show the fields for customization lines" do
        page.should have_content(@option_type.presentation)
        find(".product-option-type li#option_value_#{@customizable.id} .customization").should have_css(%Q|input[type=text]|)
      end

      context "when adding to cart" do

        before do
          choose 'Two Lines'
          fill_in "customizations_#{@customizable.id}_0", :with => 'Zed'
          fill_in "customizations_#{@customizable.id}_1", :with => 'is Dead'
          click_button 'Add To Cart'
        end

        it "should show the customization values" do
          find('td[data-hook=cart_item_description]').should have_content @customizable.presentation
          find('td[data-hook=cart_item_description]').should have_content 'Zed'
          find('td[data-hook=cart_item_description]').should have_content 'is Dead'
        end
      end

    end
end
