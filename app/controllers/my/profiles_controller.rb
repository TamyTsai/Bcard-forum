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
