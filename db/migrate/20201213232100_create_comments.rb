class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.belongs_to :study_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
