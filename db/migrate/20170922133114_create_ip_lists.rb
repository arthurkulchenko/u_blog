class CreateIpLists < ActiveRecord::Migration[5.1]
  def change
    create_table :ip_lists do |t|
      t.inet :user_ip
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :post, foreign_key: true

      t.timestamps
    end
  end
end
