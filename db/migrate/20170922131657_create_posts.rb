class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: true, index: true
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
