class AddTokenToWebModeSignOn < ActiveRecord::Migration
  def self.up
    add_column :web_mode_sign_ons, :token, :string
  end

  def self.down
    remove_column :web_mode_sign_ons, :token
  end
end
