# $ rails g controller users
# 跟devise沒關的users controller

class Api::V1::UsersController < Api::V1::BaseController
# route設定namespace 就要在controller類別名稱加namespace
# Api模組底下的 v1模組底下的 UsersController 類別
# follow_api_v1_user    POST   /api/v1/users/:id/follow(.:format)       api/v1/users#follow

    before_action :find_user

    def follow # 追蹤使用者功能 api
    # follow_user    POST   /users/:id/follow(.:format)          users#follow
    
        # 先找到要追蹤哪個使用者 # before action已做

        # 修改資料表欄位值
        render json: {status: current_user.follow!(@user)} # 要傳給前端controller的資料（json格式）
        # current_user.follow!(@user) return '已取消追蹤' or '已追蹤'

    end

    private

    def find_user #找出 要追蹤哪個使用者
        @user = User.find(params[:id])
    end

end
