class DeleteCategoryFromStudyItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :study_items, :category
  end
end
