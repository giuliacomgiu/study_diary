class ChangeStatusDefaultValueToFalse < ActiveRecord::Migration[6.0]
  def change
    change_column_default :study_items, :status, to: false
  end
end
