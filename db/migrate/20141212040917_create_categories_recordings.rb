class CreateCategoriesRecordings < ActiveRecord::Migration
  def change
    create_table :categories_recordings do |t|
      t.references :category    # same as `t.integer :article_id`
      t.references :recording
    end
  end
  def self.down
    drop_table :categories_recordings
  end
end
