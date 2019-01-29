#!/usr/bin/env ruby
class PromotionalRule

  def nth_order code , number
    product_nth_order = [{code: "001", nth_order: 2, price_sale: 8.5},
      {code: "002", nth_order: 3, price_sale: 40.0}]
    check_product = product_nth_order.select{|p| p[:code] == code}
    product_sale = check_product.first
    return if product_sale.nil?
    product_sale[:price_sale] if number >= product_sale[:nth_order]
  end

  def item_total total
    return total if total < 60
    (0.9*total).round(2)
  end
end
