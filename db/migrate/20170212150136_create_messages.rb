class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :ttl
      t.integer :init_views
      t.integer :viewed

      t.timestamps
    end
  end
end
