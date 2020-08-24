class AddTextToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :text, :string
  end
end
