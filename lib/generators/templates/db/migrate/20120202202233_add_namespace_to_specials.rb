class AddNamespaceToSpecials < ActiveRecord::Migration
  def change
    rename_table :specials,              :spree_specials
  end
end
