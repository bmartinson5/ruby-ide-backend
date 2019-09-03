class RenameCodeTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :code_content, :contents
  end
end
