class AddStatusUpdatedAtToStudyItems < ActiveRecord::Migration[6.0]
  def change
    add_column :study_items, :status_updated_at, :date_time
  end
end
