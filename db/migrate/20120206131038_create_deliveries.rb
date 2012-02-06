class CreateDeliveries < ActiveRecord::Migration
  def self.up
    create_table :deliveries do |t|
      t.integer :transfer_no
      t.string :ordered_by
      t.text :delivery_note
      t.integer :po_no
      t.date :deliver_date
      t.references :pickup
      t.integer :phone_no
      t.text :address

      t.timestamps
    end
  end

  def self.down
    drop_table :deliveries
  end
end
