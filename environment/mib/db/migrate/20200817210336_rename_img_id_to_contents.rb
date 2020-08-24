class RenameImgIdToContents < ActiveRecord::Migration[5.2]
  def change
    rename_column :contents, :img_id, :img
  end
end
