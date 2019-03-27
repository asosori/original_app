class ChangeDatatypeMessageOfInquiries < ActiveRecord::Migration[5.2]
  def change
    change_column :inquiries, :message, :text
  end
end
