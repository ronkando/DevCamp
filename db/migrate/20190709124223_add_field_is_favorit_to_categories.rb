class AddFieldIsFavoritToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :is_favorit, :boolean, default: false
  end
end
