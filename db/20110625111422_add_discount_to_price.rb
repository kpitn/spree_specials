class AddDiscountToPrice < ActiveRecord::Migration
  def self.up
    add_column :specials, :discount, :integer
  end

  def self.down
    remove_column :specials, :discount, :integer
  end
end
