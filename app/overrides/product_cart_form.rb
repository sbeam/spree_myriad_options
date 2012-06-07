Deface::Override.new(:virtual_path => "spree/products/_cart_form",
                     :name => "cart_item_image",
                     :insert_top => "div#inside-product-cart-form",
                     :partial => "spree/products/product_cart_form",
                     :disabled => false)
