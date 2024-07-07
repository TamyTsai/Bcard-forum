# $ rails g controller posts

class Api::V1::PostsController < Api::V1::BaseController

    before_action :find_post

    def love # 為文章按愛心功能 api
    # love_api_v1_post   POST   /api/v1/posts/:id/love(.:format)    api/v1/posts#love

        # 先找到按哪篇文章的愛心（before action 已做）

        @post.increment!(:love)
        # 將posts資料表love欄位的值+1
        # increment! 驚嘆號 直接寫進資料庫 不用save兩段式
        render json: {status: @post.love} # 要傳給前端controller的資料（json格式）

    end

    def bookmark # 收藏文章功能 api
    # bookmark_api_v1_post    POST   /api/v1/posts/:id/bookmark(.:format)      api/v1/posts#bookmark

        # 先找到要收藏哪篇文章（before action 已做）

        # 讓 文章 被 當前使用者 收藏
        render json: {status: @post.bookmark!(current_user), count: @post.bookmarks.count} # 要傳給前端controller的資料（json格式）
    end

    private

    def find_post
        @post = Post.friendly.find(params[:id])
    end

end
