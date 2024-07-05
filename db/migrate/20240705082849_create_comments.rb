# $ rails g model Comment user:references post:references content:text deleted_at:datetime:index

class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.text :content
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :comments, :deleted_at
  end
end

# rails db:migrate
# == 20240705082849 CreateComments: migrating ===================================
# -- create_table(:comments)
#    -> 0.0142s
# -- add_index(:comments, :deleted_at)
#    -> 0.0006s
# == 20240705082849 CreateComments: migrated (0.0149s) ==========================