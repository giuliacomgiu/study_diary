class AddCategoryIdToStudyItem < ActiveRecord::Migration[6.0]
  def change
    add_column :study_items, :category_id, :has_one, foreign_key: true
  end
end
