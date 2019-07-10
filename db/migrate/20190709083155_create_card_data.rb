class CreateCardData < ActiveRecord::Migration[5.2]
  def change
    create_table :card_data do |t|
      t.string :drag_name
      t.string :treatment_name
      t.references :category

      t.timestamps
    end
  end
end
