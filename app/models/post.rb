# $ rails g model Post title content:text status user:references

class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  default_scope { where(deleted_at: nil) }
  # 系統中所有查詢都會套用此篩選
  # 3.0.0 :002 > Post.all
  # Post Load (0.6ms)  SELECT "posts".* FROM "posts" WHERE "posts"."deleted_at" IS NULL /* loading for pp */ LIMIT $1  [["LIMIT", 11]]

  # 覆寫既有的destroy方法（變成軟刪除）
  def destroy
    update(deleted_at: Time.now)
  end

end
