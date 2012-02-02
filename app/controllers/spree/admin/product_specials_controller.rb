class Spree::Admin::ProductSpecialsController < Spree::Admin::BaseController

  before_filter :load_product

  def index

  end

  def new
    @special = Spree::Special.new()
    @special.price = @product.price

    #@special.end_date = @special.start_date + 7.days
    #@special.end_date = @special.end_date.change(:hour => 23, :min => 59)
  end

  def create
    @special = Spree::Special.new(params[:special])
    @special.variant = @product.master
    @special.type = params[:special][:type]
    @special.type = Spree::Special::TYPES.first if @special.type.blank?
    @special.discount_show = Spree::Special::DISCOUNT_SHOW.first if @special.discount_show.blank?
    if @special.save
      redirect_to admin_product_specials_url(@product)
    else
      render :new
    end
  end

  def edit
    @special = Spree::Special.find(params[:id])
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
    @special = Spree::Special.find(params[:id])
    @special.destroy
    respond_to do |format|
      format.js  { render_js_for_destroy }
    end
  end

  private
    def load_product
      @product = Spree::Product.find_by_param(params[:product_id])
    end

end