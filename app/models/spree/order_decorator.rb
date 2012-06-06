Spree::Order.class_eval do

  alias :orig_add_variant :add_variant

  def add_variant variant, quantity=1, options=nil
    current_item = orig_add_variant(variant, quantity)
    if options.is_a? Hash

      current_item.option_values = []

      options.each do |option_type_id, option_value_id|
        if value = Spree::OptionValue.find(option_value_id)
          current_item.option_values << value
        end
      end
      current_item.save
    end
  end

end
