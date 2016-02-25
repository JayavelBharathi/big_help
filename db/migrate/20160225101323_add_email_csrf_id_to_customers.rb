class AddEmailCsrfIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :email, :string
    add_column :customers, :csrg_id, :integer
  end
end
