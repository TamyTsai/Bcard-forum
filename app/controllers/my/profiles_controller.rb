# $ rails g controller my/profiles

class My::ProfilesController < ApplicationController

    # 驗證使用者有登入 才能用profiles相關頁面 不然就踢到登入頁面
    before_action :authenticate_user!

    def collections
        @bookmarks = current_user.bookmarks.order(created_at: :desc)
        # @posts = @bookmarks.post.published.with_attached_cover_image.includes(:user)
    end

    def following
        # @users = current_user.follows.with_attached_avatar.order(created_at: :desc)
        @users = current_user.follows.order(created_at: :desc)
    end

end

# 3.0.0 :009 > User.first.bookmarks
#   User Load (0.4ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
#   Bookmark Load (0.3ms)  SELECT "bookmarks".* FROM "bookmarks" WHERE "bookmarks"."user_id" = $1 /* loading for pp */ LIMIT $2  [["user_id", 1], ["LIMIT", 11]]
#  => 
# [#<Bookmark:0x0000000125efe680 id: 34, user_id: 1, post_id: 8, created_at: Sun, 07 Jul 2024 10:10:50.888230000 CST +08:00, updated_at: Sun, 07 Jul 2024 10:10:50.888230000 CST +08:00>,
#  #<Bookmark:0x0000000125efe4c8 id: 50, user_id: 1, post_id: 9, created_at: Sun, 07 Jul 2024 10:17:41.883778000 CST +08:00, updated_at: Sun, 07 Jul 2024 10:17:41.883778000 CST +08:00>] 

# 3.0.0 :011 > Bookmark.first.post
#   Bookmark Load (0.6ms)  SELECT "bookmarks".* FROM "bookmarks" ORDER BY "bookmarks"."id" ASC LIMIT $1  [["LIMIT", 1]]
#   Post Load (0.3ms)  SELECT "posts".* FROM "posts" WHERE "posts"."deleted_at" IS NULL AND "posts"."id" = $1 LIMIT $2  [["id", 8], ["LIMIT", 1]]
#  => #<Post:0x00000001354912c8 id: 8, title: "小黃狗的首篇文章", content: "敘述敘述敘述", status: "draft", user_id: 2, created_at: Thu, 04 Jul 2024 15:11:12.555389000 CST +08:00, updated_at: Sun, 07 Jul 2024 23:33:24.319091000 CST +08:00, deleted_at: nil, slug: "小黃狗的首篇文章", love: 4> 
