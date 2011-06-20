Product.class_eval do

  has_many :specials, :through => :master

  def flash_sale
    self.specials.where(:type => Special::FlashSale).
            where(["start_date < ? and (end_date > ? or end_date IS NULL)",Time.now,Time.now]).
            order("start_date DESC").first
  end

  def promo
    self.specials.where(:type => Special::Promo).
            where(["start_date < ? and (end_date > ? or end_date IS NULL)",Time.now,Time.now]).
            order("start_date DESC").first
  end

  def sale
    self.specials.where(:type => Special::Sale).
            where(["start_date < ? and (end_date > ? or end_date IS NULL)",Time.now,Time.now]).
            order("start_date DESC").first
  end

end