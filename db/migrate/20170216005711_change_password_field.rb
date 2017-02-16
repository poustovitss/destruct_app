class ChangePasswordField < ActiveRecord::Migration
  def change
    rename_column :messages, :password, :has_password
  end
end
