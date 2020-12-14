class RemoveCommentFromStudyItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :study_items, :comment, :text
  end
end
