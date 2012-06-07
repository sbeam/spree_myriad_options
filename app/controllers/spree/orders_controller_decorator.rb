Spree::OrdersController.class_eval do

  alias :populate_orig :populate

  # prepend to orders#populate to
  # look for params[:options] and attach the option values 
  # to the add_variant call
  def populate
    @order = current_order(true)

    if params[:options].present? && params[:variants]
      params[:variants].each do |variant_id, quantity|
        if variant = Spree::Variant.find(variant_id)
          option_value_ids = params[:options].values.map(&:to_i)
          @order.add_variant(variant, quantity, option_value_ids)
        end
      end
      params.delete(:variants) # prevent populate_orig from adding again
    end

    populate_orig
  end

end
