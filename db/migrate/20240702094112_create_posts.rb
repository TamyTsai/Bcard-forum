# $ rails g model Post title content:text status user:references

class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :status, default: 'draft'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

# rails db:migrate
# == 20240702094112 CreatePosts: migrating ======================================
# -- create_table(:posts)
#    -> 0.0069s
# == 20240702094112 CreatePosts: migrated (0.0069s) =============================