class DeleteCategoryIdFromStudyItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :study_items, :category_id
  end
end
