class CreatePaymentHistories < ActiveRecord::Migration
  def self.up
    create_table :payment_histories do |t|
      t.string :customer
      t.string :items
      t.string :total

      t.timestamps
    end
  end

  def self.down
    drop_table :payment_histories
  end
end
