Spree::Order.class_eval do

  def contains? variant, options
    line_items.detect { |line_item| line_item.variant_id == variant.id }
  end


  def add_variant variant, quantity=1, options=nil

    current_item = contains?(variant, options)

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
