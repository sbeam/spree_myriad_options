require 'spec_helper'

describe Spree::LineItemOptionValue do
  it { should belong_to(:line_item) }
  it { should belong_to(:option_value) }
end
