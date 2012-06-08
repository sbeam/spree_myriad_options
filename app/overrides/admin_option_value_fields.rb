Deface::Override.new(:virtual_path => "spree/admin/option_types/_option_value_fields",
                     :name => "admin_option_value_fields",
                     :insert_after => "tr[data-hook=option_value] td.presentation",
                     :partial => "spree/admin/option_value_fields",
                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/admin/option_types/edit",
                     :name => "admin_option_value_header",
                     :insert_after => "thead[data-hook=option_header] th:nth-child(2)",
                     :text => '<th>Adder</th>',
                     :disabled => false)
