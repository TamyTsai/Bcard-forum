# $ rails g controller comments

class CommentsController < ApplicationController

    # 驗證使用者有登入 才能用post相關頁面 不然就踢到登入頁面
    before_action :authenticate_user!

    before_action :find_post, only: [:create, :edit, :update, :destroy]

    def create
        # 先找出要被留言的文章（before action）

        # 於post model 設定 has_many :comments 後可以寫成
        @comment = @post.comments.new(comment_params)
        # 可對post實體使用comments方法

        @comment.user = current_user # 寫下留言的使用者，為當前登入的使用者
        # comment belongs to user

        if @comment.save
            render js: "alert('留言建立成功')"
            # js 為 javascript
        else
            render js: "alert('留言建立失敗')"
        end

    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def comment_params # 資料清洗
        params.require(:comment).permit(:content)
    end

    def find_post
        @post = Post.friendly.find(params[:post_id])
        # 找出要被留言的文章
    end

end
