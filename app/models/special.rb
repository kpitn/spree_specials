class Special < ActiveRecord::Base

  belongs_to :variant


  scope :current, :conditions => [" (start_date < ? and end_date > ?) OR (start_date < ? and end_date IS NULL) ", Time.now, Time.now, Time.now]

  TYPES = ["Special::Promo","Special::FlashSale","Special::Sale"]

  DISCOUNT_SHOW = ["nothing","purcent","amount"]
#
#  after_save :set_variant_special_price
#  after_create :set_variant_special_price
#
#  private
#    def set_variant_special_price
#      self.variant.save
#    end

end
