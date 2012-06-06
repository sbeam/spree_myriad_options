require 'spec_helper'

describe Spree::OptionValue do

  it { should have_many(:line_item_option_values) }

end
