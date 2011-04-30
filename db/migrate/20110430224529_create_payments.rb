class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :price
      t.text :description
      t.date :paid_on
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
