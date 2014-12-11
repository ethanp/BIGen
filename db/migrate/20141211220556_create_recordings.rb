class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.string :name, null: false
      t.references :user, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :recordings, :users
  end
end
