# $ rails g controller posts

class PostsController < ApplicationController

    before_action :authenticate_user!
    # 後面還可以接only 或 except

    before_action :find_post, only: [:edit, :update, :destroy]
    # rails 7.1後only except裡面不能寫還沒寫的action，但可以改變設定：`config.action_controller.raise_on_missing_callback_actions` to `false`.

    def index
        # @posts = current_user.posts.order(created_at: :desc).where(deleted_at: nil)
        # 改用default scope

        @posts = current_user.posts.order(created_at: :desc)
    end

    def new # 建立文章表單頁面 對應的動作
        # @post = Post.new
        # 於user model 設定 has_many :posts 後可以寫成
        @post = current_user.posts.new
        # 可對user實體（devise的current_user）使用posts方法
    end

    def create # 送出建立文章表單
        @post = current_user.posts.new(post_params)
        @post.status = 'published' if params[:publish] 
        # params hash中有:publish這個key的話（若使用者按發佈按鈕，就會讓params hash中有:publish這個key） 就將posts資料表status欄位值指定為published
        # 文章status欄位預設值為draft，所以不用寫該情況

        if @post.save
            if params[:publish] # 若按下 發佈按鈕
                redirect_to posts_path, notice: '文章發佈成功'
            else # 若按下 儲存為草稿按鈕
                redirect_to edit_post_path(@post), notice: '文章已儲存為草稿'
            end 
        else
            render :new
        end
    end

    def edit
    end
    
    def update
        if @post.update(post_params)
            redirect_to posts_path, notice: '文章更新成功'
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path, notice: '文章已刪除'
    end

    private
    def post_params # 資料清洗
        params.require(:post).permit(:title, :content)
    end

    def find_post
        @post = current_user.posts.find(params[:id])
        # find找不到時會噴exception ActiveRecord::RecordNotFound
        # 可用bigin resue局部處理 或是提升到controller層級
        # begin
        #     @post = current_user.posts.find(params[:id])
        # rescue => exception
        # end
    end
end
