class AddHashToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :unique_hash, :string
  end
end
