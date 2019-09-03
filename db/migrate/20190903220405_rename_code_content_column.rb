class RenameCodeContentColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :contents, :code_content, :content
  end
end
