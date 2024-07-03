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

        if @post.save
            redirect_to posts_path, notice: '文章新增成功'
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
