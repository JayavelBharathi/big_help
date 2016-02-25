class AddColumnsToTables < ActiveRecord::Migration
  def change
  	add_column :attachments, :user_id, :integer
  	add_column :comments, :user_id, :integer
  end
end
