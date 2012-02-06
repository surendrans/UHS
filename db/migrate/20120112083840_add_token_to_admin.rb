class AddTokenToAdmin < ActiveRecord::Migration
  def self.up
    add_column :admins, :token, :string
  end

  def self.down
    remove_column :admins, :token
  end
end
