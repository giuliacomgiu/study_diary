class AddStudyItemIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :study_item_id, :integer
  end
end
