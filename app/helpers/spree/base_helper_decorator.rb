Spree::BaseHelper.module_eval do


  def top_special_price(product)
    if product.flash_sale
      if product.flash_sale.discount
        discount = product.flash_sale.discount
      else
        discount =   (product.price - product.flash_sale.amount) * 100 / product.price
      end
    else
      if product.promo
        if product.promo.discount
          discount = product.promo.discount
        else
          discount =  (product.price - product.promo.amount) * 100 / product.price
        end
      end
    end
    "<span class=\"pourcentage\">- #{discount.to_i} %</span>".html_safe if discount
  end


  def special_price(product)
    html = ""
    if product.sale
      unless product.sale.discount
        html +="<span class=\"regular_price\">#{product.price}</span>"
        html +="<span class=\"special_price\">#{product.sale.amount}</span>"
      end
    else
      if product.flash_sale
        unless product.flash_sale.discount
          html +="<span class=\"regular_price\">#{product.price}</span>"
          html +="<span class=\"special_price\">#{product.flash_sale.amount}</span>"
        end
      else
        if product.promo
          unless product.promo.discount
            html +="<span class=\"regular_price\">#{product.price}</span>"
            html +="<span class=\"special_price\">#{product.promo.amount}</span>"
          end
        else
          html +="<span class=\"selling_price\">#{product.price}</span>"
        end
      end
    end
    return html.html_safe
  end

end