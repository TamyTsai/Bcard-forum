# $ rails g controller pages
class PagesController < ApplicationController

    before_action :find_post, only: [:show]

    def index # 所有已發佈文章列表（首頁、最新文章）# 按照文章建立時間排序 已發佈文章
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
        @user = User.find_by(username: params[:username])
        @posts = @user.posts.published.order(created_at: :desc)
        @follow_count = Follow.where(following_id: @user).count
    end

    def hot # 熱門文章 # 按照文章愛心數排序 已發佈文章
        @posts = Post.published_posts_love
    end

    def rank # 創作者列表 # 按照帳號建立新舊時間排序
        @ranks = User.with_attached_avatar.order(created_at: :desc)
    end

    private

    def find_post
        @post = Post.friendly.find(params[:post_id])
        # 從網址給的資訊 找出特定文章
    end

end
