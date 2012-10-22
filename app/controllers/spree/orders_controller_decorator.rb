Spree::OrdersController.class_eval do

  alias_method :populate_without_spree_myriad_options, :populate

  # prepend to orders#populate to
  # look for params[:options] and attach the option values
  # to the add_variant call
  def populate
    @order = current_order(true)

    if params[:options].present? && params[:variants]

      params[:variants].each do |variant_id, quantity|
        if variant = Spree::Variant.find(variant_id)
          quantity = quantity.to_i

          option_values = Spree::OptionValue.find(params[:options].values.map(&:to_i))

          line_item = @order.add_variant(variant, quantity, option_values)

          line_item.customizations = params[:customizations] if params[:customizations]
        end
      end

      params.delete(:variants) # prevent populate_orig from adding again
    end

    populate_without_spree_myriad_options
  end

end
