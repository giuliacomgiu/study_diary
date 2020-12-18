class RemoveStatusAndRenameStatusUpdatedOnStudyItem < ActiveRecord::Migration[6.0]
  def change
    change_table :study_items do |t|
      t.remove :status
      t.rename :status_updated_at, :completed_at
    end
  end
end
