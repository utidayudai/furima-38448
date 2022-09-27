class CreateSells < ActiveRecord::Migration[6.0]
  def change
    create_table :sells do |t|
      t.string       :title,                null: false
      t.text         :title_content,        null: false
      t.integer      :price,                null: false
      t.integer      :category_id,          null: false
      t.integer      :condition_id,         null: false
      t.integer      :derivery_price_id,    null: false
      t.integer      :place_id,             null: false
      t.integer      :delively_id,          null: false
      t.references   :user,                 null: false, foreign_key: true

      t.timestamps
    end
  end
end
