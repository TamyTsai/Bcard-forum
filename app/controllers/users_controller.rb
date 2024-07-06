# $ rails g controller users
# 跟devise沒關的users controller

class UsersController < ApplicationController

    before_action :find_user

    skip_before_action :verify_authenticity_token, only: [:follow]
    # 表單透過api打來這時 不檢查token

    def follow # 追蹤使用者功能 api
    # follow_user    POST   /users/:id/follow(.:format)          users#follow
        if user_signed_in? # 在這裡檢查使用者是否有登入 有登入才能追蹤文章作者
            # 先找到要追蹤哪個使用者 # before action已做

            # 修改資料表欄位值
            # user.following = user

            render json: {status: '追蹤中'} # 要傳給前端controller的資料（json格式）
        else
            render json: {status: '先登入才能追蹤作者喔'}
        end
    end

    private

    def find_user #找出要追蹤哪個使用者
        @user = User.find(params[:id])
    end

end