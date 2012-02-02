class ShowDiscount < ActiveRecord::Migration
  def self.up
    add_column :specials, :discount_show, :string, :limit => 20
  end

  def self.down
    remove_column  :specials, :discount_show
  end
end
