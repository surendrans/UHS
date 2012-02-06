class CreateAdminsProducts < ActiveRecord::Migration
  def self.up
    create_table :admins_products, :id => false do |t|
      t.integer :admin_id
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :admins_products
  end
end
