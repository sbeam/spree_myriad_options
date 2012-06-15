require 'spec_helper'

describe Spree::LineItemOptionValue do
  it { should belong_to(:line_item) }
  it { should belong_to(:option_value) }

  it { should have_db_column(:option_value_customization).of_type(:text) }
  it { should have_db_column(:adder).of_type(:decimal).with_options(:precision => 8, :scale => 2) }

end
