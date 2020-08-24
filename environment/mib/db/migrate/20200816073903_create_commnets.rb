class CreateCommnets < ActiveRecord::Migration[5.2]
  def change
    create_table :commnets do |t|
      t.integer :user_id
      t.integer :content_id
      t.text :text
      t.timestamps
    end
  end
end
