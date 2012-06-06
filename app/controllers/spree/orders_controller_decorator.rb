Spree::OrdersController.class_eval do

  alias :populate_orig :populate

  def populate
    @order = current_order(true)

    if params[:option_values].present? && params[:variant_id]
      quantity = (params[:quantity].present?) ? params[:quantity].to_i : 1
      variant_id = params[:variant_id].to_i
      variant = Spree::Variant.find(variant_id)
      @order.add_variant(variant, quantity, params[:option_values])
    end

    populate_orig
  end

end
