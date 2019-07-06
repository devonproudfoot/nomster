class AddPhotographToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :photograph, :string
  end
end
