Deface::Override.new(:virtual_path => "spree/admin/shared/_order_details",
                     :name => "admin_order_details_line_item_row",
                     :replace => "tr[data-hook=order_details_line_item_row] td:first-child", # replace the first <td> in the row only
                     :partial => "spree/admin/order_details_line_item_row",
                     :disabled => false)

