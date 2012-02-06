class CreateDeliveryUnits < ActiveRecord::Migration
  def self.up
    create_table :delivery_units do |t|
      t.string :manufacturer
      t.string :unit_model
      t.text :desc
      t.string :prefix_serial
      t.references :delivery

      t.timestamps
    end
  end

  def self.down
    drop_table :delivery_units
  end
end
