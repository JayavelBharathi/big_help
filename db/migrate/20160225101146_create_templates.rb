class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :title
      t.text :description
      t.references :parent, index: true

      t.timestamps
    end
  end
end
