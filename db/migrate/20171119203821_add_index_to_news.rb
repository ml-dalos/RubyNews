class AddIndexToNews < ActiveRecord::Migration[5.1]
  def change
    add_index :news, :link, unique: true
  end
end
