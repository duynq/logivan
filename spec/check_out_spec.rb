require 'check_out'

describe 'CheckOut' do
  
  context "when have total promotion" do
    it 'have total promotion' do
      promotional_rule = PromotionalRule.new
      co = CheckOut.new promotional_rule
      p = Product.new("001", "Lavender heart", 9.25)
      p1 = Product.new("002", "Personalised cufflinks", 45.00)
      p2 = Product.new("003", "Kids T-shirt", 19.95)
      co.scan(p)
      co.scan(p1)
      co.scan(p2) 
      expect(co.handle_total_price).to be 66.78
    end
  end

  context "when have nth order promotion" do
    it "have nth order promotion" do
      promotional_rule = PromotionalRule.new
      co = CheckOut.new promotional_rule
      p = Product.new("001", "Lavender heart", 9.25)
      p1 = Product.new("003", "Kids T-shirt", 19.95)
      p2 = Product.new("001", "Lavender heart", 9.25)
      co.scan(p)
      co.scan(p1)
      co.scan(p2) 
      expect(co.handle_total_price).to be 36.95
    end
  end

  context "when have both nth order and total price promotion" do
    it "Have both nth order and total price promotion" do
      promotional_rule = PromotionalRule.new
      co = CheckOut.new promotional_rule
      p = Product.new("001", "Lavender heart", 9.25)
      p3 = Product.new("002", "Personalised cufflinks", 45.00)
      p1 = Product.new("003", "Kids T-shirt", 19.95)
      p2 = Product.new("001", "Lavender heart", 9.25)
      co.scan(p)
      co.scan(p1)
      co.scan(p2)
      co.scan(p3)
      expect(co.handle_total_price).to be 73.76
    end
  end
end