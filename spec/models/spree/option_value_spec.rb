require 'spec_helper'

describe Spree::OptionValue do

  it { should have_many(:line_item_option_values) }

  it { should have_db_column(:adder).
              of_type(:decimal).
              with_options(:precision => 8, :scale => 2) }

end
