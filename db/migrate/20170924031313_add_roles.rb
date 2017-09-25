class AddRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|      
      t.string :name, null: false
    end
  end
end
