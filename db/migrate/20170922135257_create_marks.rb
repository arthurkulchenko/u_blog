class CreateMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :marks do |t|
      t.belongs_to :post, foreign_key: true
      t.belongs_to :user
      t.integer :points

      t.timestamps
    end
  end
end
