class CreateVirtualmachines < ActiveRecord::Migration
  def change
    create_table :virtualmachines do |t|
      t.string :name
      t.string :os
      t.string :ip
      t.text :description
      t.integer :memory
      t.integer :cpu
      t.integer :hdd
      t.string :hostname

      t.timestamps
    end
  end
end
