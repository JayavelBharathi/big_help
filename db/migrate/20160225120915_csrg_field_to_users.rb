class CsrgFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :csrg, :string
  end
end
