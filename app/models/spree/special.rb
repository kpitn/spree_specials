class Spree::Special < ActiveRecord::Base

  belongs_to :variant

  scope :current, :conditions => [" (start_date < ? and end_date > ?) OR (start_date < ? and end_date IS NULL) ", Time.now, Time.now, Time.now]

  TYPES = ["Spree::Special::Promo","Spree::Special::FlashSale","Spree::Special::Sale"]

  DISCOUNT_SHOW = ["nothing","purcent","amount","two_price"]

  after_initialize :set_default_prices

  attr_accessible :amount, :start_date, :end_date, :type

  #attr_accessor :discount

  delegate_belongs_to :variant, :price

  def discount(value)

  end

  def discount
    ((variant.price - (variant.price-amount)) * 100 / variant.price).round(1);
  end

  private

    def set_default_prices
      #self.price  ||= variant.price           #will set the default value only if it's nil
      self.amount  ||= 0.0
      self.start_date ||= Time.now
      self.type ||= Spree::Special::Promo
      self.discount_show ||=  Spree::Special::DISCOUNT_SHOW.first
    end

  #protected
    #def set_default_prices
    #  self.type = Spree::Special::Promo
    #  #self.price ||= 10
    #end



#  after_save :set_variant_special_price
#  after_create :set_variant_special_price
#
#  private
#    def set_variant_special_price
#      self.variant.save
#    end

end
