# $ rails g controller pages
class PagesController < ApplicationController

    before_action :find_post, only: [:show]

    def index # 所有已發佈文章列表（首頁、最新文章）# 按照文章建立時間排序 已發佈文章

        # @posts = Post.where(status: 'published').order(created_at: :desc).includes(:user)
        # 顯示頁面時，伺服器會重複搜尋user多次，有N+1問題
        # .includes(:user)可解決此問題

        # @posts = Post.published_posts.order(created_at: :desc).includes(:user)
        # 搜尋條件寫在 post model 中 scope :published_posts, -> { where(status: 'published') }
        # 提升程式碼再用性

        # @posts = Post.published.with_attached_cover_image.order(created_at: :desc).includes(:user)
        # published為aasm送的方法，能撈出所有 狀態欄位 值 為published的文章，不用自己寫scope
        # .with_attached_cover_image方法可以 解決頁面顯示 ActiveStorage上傳之檔案 的N+1問題
        # orage_attachments"."record_id" IN ($3, $4, $5)  [["record_type", "Post"], ["name", "cover_image"], ["record_id", 9], ["record_id", 7], ["record_id", 1]]
        # 12:40:14 web.1  |   ↳ app/views/pages/shared/_published-posts-list.html.erb:9

        @posts = Post.published_posts_created_at
        # post model：scope :published_posts_created_at, -> { published.with_attached_cover_image.order(created_at: :desc).includes(:user) }
    end

    def show # 單一文章頁面
        # 留言表單因為位於單一文章頁面，所以是使用pages controller的show action
        @comment = @post.comments.new # 建立留言物件
        # @comments = @post.comments.order(id: :desc) # 撈出所有留言（按comment_id反向排序）
        @comments = @post.comments.order(created_at: :desc)
    end

    def user # 單一使用者文章列表
    end

    def hot # 熱門文章 # 按照文章愛心數排序 已發佈文章
        @posts = Post.published_posts_love
    end

    def rank # 創作者排行榜 # 按照被追蹤數顯示使用者
        # 等有追蹤欄位後修改
        @ranks = User.all
    end

    private

    def find_post
        @post = Post.friendly.find(params[:post_id])
        # 從網址給的資訊 找出特定文章
    end

end
