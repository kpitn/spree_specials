class CreateSpecials < ActiveRecord::Migration
  def self.up
    create_table :specials do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.integer :author_id
      t.integer :variant_id
      t.string :type
      t.timestamps
    end
    add_index :specials, :author_id
    add_index :specials, :type
    add_index :specials, :variant_id
  end

  def self.down
    drop_table :specials
  end
end
