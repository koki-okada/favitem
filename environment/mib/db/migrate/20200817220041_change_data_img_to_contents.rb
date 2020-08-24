class ChangeDataImgToContents < ActiveRecord::Migration[5.2]
  def change
    change_column :contents, :img, :string
  end
end
