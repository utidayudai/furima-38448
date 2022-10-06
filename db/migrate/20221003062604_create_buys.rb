class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.integer      :place_id,             null: false
      t.string       :city,                 null: false
      t.string       :address_number,       null: false
      t.string       :address,              null: false
      t.string       :building
      t.string       :phone_number,         null: false
      t.references   :buy_record,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
