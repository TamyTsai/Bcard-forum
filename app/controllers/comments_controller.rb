# $ rails g controller comments

class CommentsController < ApplicationController

    # 驗證使用者有登入 才能用留言相關頁面、功能 不然就踢到登入頁面
    before_action :authenticate_user!

    before_action :find_post, only: [:create, :edit, :update, :destroy]
    before_action :find_comment, only: [:edit, :update, :destroy]

    def create
        # 會去views底下找同名檔案 comments>create.js.erb
        # 沒有寫redirect to，所以表單送出後會去找create.js.erb執行js（因為有form_with remote: true）

        # 先找出要被留言的文章（before action）

        # 於post model 設定 has_many :comments 後可以寫成
        @comment = @post.comments.new(comment_params)
        # 可對post實體使用comments方法

        @comment.user = current_user # 寫下留言的使用者，為當前登入的使用者
        # comment belongs to user

        # if @comment.save
        #     # render js: "alert('留言建立成功')"
        #     # js 為 javascript
        # else
        #     render js: "alert('留言建立失敗')"
        # end
        
        render js: "alert('留言建立失敗')" unless @comment.save
    end

    def edit
    end

    def update
    end

    def destroy
        @comment.destroy
        redirect_to post_comment_path, notice: '留言已刪除', status: :see_other
    end

    private

    def comment_params # 留言表單 資料清洗
        params.require(:comment).permit(:content)
    end

    def find_post # 找出要被留言的 文章
        @post = Post.friendly.find(params[:post_id])
    end

    def find_comment # 找出文章下的特定留言
        @comment = @post.comments.find(params[:id])
    end

end
