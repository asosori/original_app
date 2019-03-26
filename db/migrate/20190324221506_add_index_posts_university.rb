class AddIndexPostsUniversity < ActiveRecord::Migration[5.2]
  def change
    add_index :posts, [:university, :department, :major, :proffesor], name: "add_index_to_posts"
  end
end
