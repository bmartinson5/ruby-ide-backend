class AddCodeTable < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.json :content
      t.integer :problem_index
    end
  end
end
