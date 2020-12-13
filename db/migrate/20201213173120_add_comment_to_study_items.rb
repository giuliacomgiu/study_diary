class AddCommentToStudyItems < ActiveRecord::Migration[6.0]
  def change
    add_column :study_items, :comment, :text
  end
end
