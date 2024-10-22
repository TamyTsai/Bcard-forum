# $ rails g controller posts

class PostsController < ApplicationController

    # 驗證使用者有登入 才能用post相關頁面 不然就踢到登入頁面
    before_action :authenticate_user!

    before_action :find_post, only: [:edit, :update, :destroy]
    # rails 7.1後only except裡面不能寫還沒寫的action，但可以改變設定：`config.action_controller.raise_on_missing_callback_actions` to `false`.

    def index
        @posts = current_user.posts.order(created_at: :desc)
    end

    def new # 建立文章表單頁面 對應的動作
        @post = current_user.posts.new
    end

    def create # 送出建立文章表單
        @post = current_user.posts.new(post_params)
        @post.publish! if params[:publish] 
        # post model已設定no_direct_assignment: true 所以不能直接改欄位值 要用aasm的方法
        # params hash中有:publish這個key的話（若使用者按發佈按鈕，就會讓params hash中有:publish這個key） 就將posts資料表status欄位值指定為published
        # 文章status欄位預設值為draft，所以不用寫該情況

        if @post.save
            # 新增文章頁面 發佈 與 儲存為草稿 按鈕 之流程判斷
            if params[:publish] # 若按下 發佈按鈕
                redirect_to posts_path, notice: '文章發佈成功'
            else # 若按下 儲存按鈕
                redirect_to edit_post_path(@post), notice: '文章已儲存為草稿'
            end 
        else
            render :new, status: :unprocessable_entity # 否則，動作會重新顯示表單，方法是使用狀態碼 422 無法處理的實體 呈現 app/views/articles/new.html.erb。
        end
    end

    def edit
    end
    
    def update

        if @post.update(post_params) # 若 成功更新文章
            # 編輯文章頁面 發佈、下架文章 與 儲存為草稿 按鈕 之流程判斷
            case
            when params[:publish] # 若按下 發佈按鈕
                @post.publish!
                redirect_to posts_path, notice: '文章已發佈'
            when params[:unpublish] # 若按下 文章下架按鈕
                @post.unpublish!
                redirect_to posts_path, notice: '文章已下架'
            else # 若按下 儲存按鈕
                redirect_to edit_post_path(@post), notice: '文章已儲存'
            end
        else # 寫入資料庫失敗
            render :edit, status: :unprocessable_entity # 重新顯示表單（包含錯誤訊息），方法是使用狀態碼 422 無法處理的實體 呈現 app/views/articles/edit.html.erb
        end

    end

    def destroy
        @post.destroy # 使用paranoia套件後，此處的destroy方法 已經 不會把資料直接從資料庫 抹除
        redirect_to posts_path, notice: '文章已刪除', status: :see_other
        # destroy 動作會從資料庫中擷取文章（before action），並呼叫 destroy。然後，它會將瀏覽器重新導向到 文章列表頁，狀態碼為 303 另尋他處。
    end

    private
    def post_params # 資料清洗
        params.require(:post).permit(:title, :content, :cover_image)
    end

    def find_post
        @post = current_user.posts.friendly.find(params[:id])
    end
end
