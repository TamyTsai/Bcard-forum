# $ rails g controller posts

class Api::V1::PostsController < Api::V1::BaseController

    def love # 為文章按愛心功能 api
    # love_api_v1_post   POST   /api/v1/posts/:id/love(.:format)    api/v1/posts#love

        # 先找到按哪篇文章的愛心（befor action已做）
        post = Post.friendly.find(params[:id])
        post.increment!(:love)
        # 將posts資料表love欄位的值+1
        # increment! 驚嘆號 直接寫進資料庫 不用save兩段式
        render json: {status: post.love} # 要傳給前端controller的資料（json格式）

    end

end
