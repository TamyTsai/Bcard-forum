# $ rails g model Follow user:references following_id:integer:index
# 專門存放使用者間追蹤關係的表
# 把 多對多 拆成 多對一對多

class CreateFollows < ActiveRecord::Migration[7.1]
  def change
    create_table :follows do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :following_id

      t.timestamps
    end
    add_index :follows, :following_id
  end
end

# $ rails db:migrate
# == 20240706085321 CreateFollows: migrating ====================================
# -- create_table(:follows)
#    -> 0.0112s
# -- add_index(:follows, :following_id)
#    -> 0.0010s
# == 20240706085321 CreateFollows: migrated (0.0123s) ===========================