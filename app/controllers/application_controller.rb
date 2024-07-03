class ApplicationController < ActionController::Base

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    # 捕捉到ActiveRecord::RecordNotFound exception時，就使用record_not_found方法

    private
    
    def record_not_found
        render file: "#{Rails.root}/public/404.html", # 讀取404頁面
               status: :not_found,
               layout: false # 不套用預設的application layout
    end

end
