class CreateWebModeSignOns < ActiveRecord::Migration
  def self.up
    create_table :web_mode_sign_ons do |t|
      t.string :name
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :web_mode_sign_ons
  end
end
