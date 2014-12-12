class CreateCategoriesUsers < ActiveRecord::Migration
  def change
    create_table :categories_users do |t|
      t.references :category    # same as `t.integer :article_id`
      t.references :user
    end
  end
  def self.down
    drop_table :categories_users
  end
end
