class AddIndexPostsProfessor < ActiveRecord::Migration[5.2]
  def change
    add_index :posts, :professor
  end
end
