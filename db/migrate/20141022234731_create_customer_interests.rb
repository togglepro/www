class CreateCustomerInterests < ActiveRecord::Migration
  def change
    create_table :customer_interests do |t|
      t.string :name
      t.string :email
      t.string :content

      t.timestamps
    end
  end
end
