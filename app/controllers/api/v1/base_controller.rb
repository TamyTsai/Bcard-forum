class Api::V1::BaseController < ApplicationController
    # 寫api v1 controller共用的東西

    skip_before_action :verify_authenticity_token
    # 表單透過api打來時 不檢查token

    before_action :check_login
    # 跟api有關的功能 都先檢查使用者是否有登入 沒登入就回一包{status: '使用者未登入'}的json檔給前端

    private

    def check_login
        unless user_signed_in? # 使用者沒登入的話
            render json: {status: '使用者未登入'}
            return
        end
    end

end