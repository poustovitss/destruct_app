class AddPasswordToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :password, :boolean, default: false
  end
end
