Deface::Override.new(:virtual_path => "spree/admin/shared/_order_details",
                     :name => "admin_order_form_line_item_row",
                     :replace => "tr[data-hook=order_details_line_item_row] td:first-child", #[data-hook=admin_order_form_line_item_row]", # replace the first <td> in the row only?
                     :partial => "spree/admin/admin_order_form_line_item_row",
                     :disabled => false)

