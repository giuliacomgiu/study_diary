class CategoriesAndStudyItemsManyToMany < ActiveRecord::Migration[6.0]
  def change
    create_join_table :study_items, :categories, column_options: { null: true }
    remove_column :study_items, :category_id
  end
end
