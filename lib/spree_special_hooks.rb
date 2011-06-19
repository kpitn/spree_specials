class SpreeSpecialHooks < Spree::ThemeSupport::HookListener
  Deface::Override.new(:virtual_path => "admin/shared/_product_tabs",
                     :name => "converted_admin_product_tabs_35139327911",
                     :insert_bottom  => "[data-hook='admin_product_tabs']",
                     :partial => "admin/shared/specials_products_tabs",
                     :disabled => false)

end