class ModifyCsrgIdOnCustomers < ActiveRecord::Migration
  def change
    rename_column :customers, :csrg_id, :csrg
    change_column :customers, :csrg, :string
  end
end
