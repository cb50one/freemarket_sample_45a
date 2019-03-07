class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :zip_code,         null: false
      t.string :prefecture,       null: false
      t.string :city,             null: false
      t.string :street,           null: false
      t.string :building
      t.references :user, foreign_key: true
      t.string :phone_number
      t.timestamps
    end
  end
end
