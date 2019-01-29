#!/usr/bin/env ruby
require 'product'
require 'promotional_rule'

class CheckOut
 
  attr_accessor :promotional_rule, :products
  
  def initialize promotional_rule
    @promotional_rule = promotional_rule
    @products = []
    @total = 0.00
  end

  def scan product
    products << product
  end

  def handle_total_price
    products.group_by(&:code).each do |key, val|
      price_sale = promotional_rule.nth_order key, val.count
      if price_sale
        @total += price_sale*val.count
      else
        @total += val.first.price * val.count
      end
    end
    promotional_rule.item_total @total
  end
end
