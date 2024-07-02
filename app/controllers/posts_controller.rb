# $ rails g controller posts

class PostsController < ApplicationController

    before_action :authenticate_user!
    # 後面還可以接only 或 except

    def new # 建立文章表單頁面 對應的動作
        # @post = Post.new
        # 於user model 設定 has_many :posts 後可以寫成
        @post = current_user.posts.new
        # 可對user實體（devise的current_user）使用posts方法
    end

    def create # 送出建立文章表單
        @post = current_user.posts.new(post_params)

        if @post.save
            redirect_to posts_path, notice: '新增成功'
        else
            render :new
        end
    end

    private
    def post_params # 資料清洗
        params.require(:post).permit(:title, :content)
    end
end
