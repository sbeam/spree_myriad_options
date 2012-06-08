require 'spec_helper'

describe 'admin/option_types' do

  before do
    @option_type = create(:option_type, :name => 'lug-finish', :presentation => 'Wheel Lug Finish')
    create(:option_value, :name => 'metal-umber', :presentation => 'Metallic Umber', :option_type => @option_type, :adder => 3.05)
    create(:option_value, :name => 'neon-pink', :presentation => 'Neon Pink', :option_type => @option_type, :adder => 1.00)
  end

  context "when editing option types" do

    before do
      visit spree.edit_admin_option_type_path(@option_type)
    end

    it "should show the option values fields" do
      find('tbody#option_values td.name').should have_css("input[value=metal-umber]") # brittle, unnecessary
    end

    it "should include a field for option_value.adder" do
      find('tbody#option_values td.adder').should have_css("input[value='3.05']")
    end

    it "should have a header for option_value.adder" do
      find('#content table.index thead').should have_content('Adder')
    end


    context "when updating the option values" do

      it "should update the option value adder" do
        find('tbody#option_values td.adder input').set('4.00')
        click_button "Update"
        page.should have_content("successfully updated!")
        find('tbody#option_values td.adder').should have_css("input[value='4.00']")
      end

    end
  end


end
