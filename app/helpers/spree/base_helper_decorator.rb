Spree::BaseHelper.module_eval do


  def top_special_price(product)
    if product.flash_sale
      if product.flash_sale.discount
        discount = product.flash_sale.discount
      else
        discount = product.price * 100 / product.flash_sale.amount
      end
    else
      if product.promo
        if product.promo.discount
          discount = product.promo.discount
        else
          discount =  product.price * 100 / product.promo.amount
        end
      end
    end
    html ="<span class=\"pourcentage\">#{product.flash_sale.discount} %</span>" if discount
  end


  def special_price(product)
    html = ""
    if product.sale
      if product.sale.discount
        html +="<span class=\"discount_price\">#{product.sale.discount} %</span>"
      else
        html +="<span class=\"regular_price\">#{product.price}</span>"
        html +="<span class=\"special_price\">#{product.sale.amount}</span>"
      end
    else
      if product.flash_sale
        if product.flash_sale.discount
          html +="<span class=\"discount_price\">#{product.flash_sale.discount} %</span>"
        else
          html +="<span class=\"regular_price\">#{product.price}</span>"
          html +="<span class=\"special_price\">#{product.flash_sale.amount}</span>"
        end
      else
        if product.promo
          if product.promo.discount
            html +="<span class=\"discount_price_price\">#{product.promo.discount} %</span>"
          else
            html +="<span class=\"regular_price\">#{product.price}</span>"
            html +="<span class=\"special_price\">#{product.promo.amount}</span>"
          end
        end
      end
    end
    return html.html_safe
  end

end