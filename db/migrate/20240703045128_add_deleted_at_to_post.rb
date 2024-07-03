# $ rails g migration add_deleted_at_to_post deleted_at:datetime:index
#       invoke  active_record
#       create    db/migrate/20240703045128_add_deleted_at_to_post.rb
# 軟刪除 也可以透過記錄布林值來表示文章是否已被刪除，但就不知道何時被刪除
# 不過 紀錄刪除時間 比布林值佔空間

class AddDeletedAtToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :deleted_at, :datetime
    add_index :posts, :deleted_at
  end
end

# $ rails db:migrate
# == 20240703045128 AddDeletedAtToPost: migrating ===============================
# -- add_column(:posts, :deleted_at, :datetime)
#    -> 0.0031s
# -- add_index(:posts, :deleted_at)
#    -> 0.0038s
# == 20240703045128 AddDeletedAtToPost: migrated (0.0069s) ======================
