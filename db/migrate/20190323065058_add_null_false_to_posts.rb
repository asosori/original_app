class AddNullFalseToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column_null :posts, :university, false, 0
    change_column_null :posts, :department, false, 0
    change_column_null :posts, :major, false, 0
    change_column_null :posts, :professor, false, 0
    change_column_null :posts, :detail, false, 0
  end
end
