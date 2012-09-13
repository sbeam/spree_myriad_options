Spree::Order.class_eval do

  def find_line_item_by_variant_and_options variant, options
      options ||= []
      line_items.detect { |line_item| line_item.variant_id == variant.id  && line_item.option_values == options }
  end

  def contains_with_options? variant, options=nil
      if options
          find_line_item_by_variant_and_options(variant, options)
      else
          contains_without_options?(variant)
      end
  end

  alias_method_chain :'contains?', :options

  def add_variant variant, quantity=1, options=nil

    current_item = find_line_item_by_variant_and_options(variant, options)

    if current_item
      current_item.quantity += quantity
      current_item.save
    else
      current_item = Spree::LineItem.new(:quantity => quantity)
      current_item.variant = variant
      current_item.price   = variant.price

      current_item.option_values = options if options

      self.line_items << current_item
    end

    current_item

  end

end
