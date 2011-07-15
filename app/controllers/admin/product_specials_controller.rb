class Admin::ProductSpecialsController < Admin::BaseController

  before_filter :load_product

  def index

  end

  def new
    @special = Special.new()
    @special.start_date = Time.now
    @special.type = Special::Promo
    @special.show_discount =  Special::DISCOUNT_SHOW.first
    #@special.end_date = @special.start_date + 7.days
    #@special.end_date = @special.end_date.change(:hour => 23, :min => 59)
  end

  def create
    @special = Special.new(params[:special])
    @special.variant = @product.master
    @special.type = params[:special][:type]
    @special.type = Special::TYPES.first if @special.type.blank?
    @special.show_discount = Special::DISCOUNT_SHOW.first if @special.show_discount.blank?
    if @special.save
      redirect_to admin_product_specials_url(@product)
    else
      render :new
    end
  end

  def edit
    @special = Special.find(params[:id])
  end

  def update
    @special = Special.find(params[:id])
    if @special.update_attributes(params[:special])
      redirect_to admin_product_specials_url(@product)
    else
      render :edit
    end
  end

  def destroy
    @special = Special.find(params[:id])
    @special.destroy
    respond_to do |format|
      format.js  { render_js_for_destroy }
    end
  end

  private
    def load_product
      @product = Product.find_by_param(params[:product_id])
    end

end