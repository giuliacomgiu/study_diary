class ChangeStatusDefaultOnStudyItem < ActiveRecord::Migration[6.0]
  def change
    change_column_default :study_items, :status, from: true, to: false
  end
end
