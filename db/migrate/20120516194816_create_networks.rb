class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :ip
      t.string :maske
      t.string :broadcast
      t.string :gateway
      t.boolean :used

      t.timestamps
    end
  end
end
