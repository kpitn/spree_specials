Product.class_eval do

  has_many :all_variants, :class_name => "Variant"
  has_many :specials, :through => :all_variants
  scope :flash_sales,  joins(:specials).
                       where("specials.type = 'Special::FlashSale'").
                       where(["specials.start_date < ? and (specials.end_date > ? or specials.end_date IS NULL)",Time.now,Time.now])
                       order("specials.start_date DESC")
  scope :promos,  joins(:specials).
                       where("specials.type = 'Special::Promo'").
                       where(["specials.start_date < ? and (specials.end_date > ? or specials.end_date IS NULL)",Time.now,Time.now])
                       order("specials.start_date DESC")
  scope :sales,  joins(:specials).
                       where("specials.type = 'Special::Sale'").
                       where(["specials.start_date < ? and (specials.end_date > ? or specials.end_date IS NULL)",Time.now,Time.now])
                       order("specials.start_date DESC")

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