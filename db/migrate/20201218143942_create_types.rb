class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :title

      t.timestamps
    end

    change_table :study_items do |t|
      t.belongs_to :type
    end
  end
end
