class CreateCardValues < ActiveRecord::Migration[5.2]
  def change
    create_table :card_values do |t|
      t.string :value_type
      t.float :value
      t.references :card_datum, foreign_key: true

      t.timestamps
    end
  end
end
