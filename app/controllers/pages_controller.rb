# $ rails g controller pages
class PagesController < ApplicationController

    def index # 所有已發佈文章列表（首頁、最新文章）# 按照文章建立時間排序 已發佈文章

        # @posts = Post.where(status: 'published').order(created_at: :desc).includes(:user)
        # 顯示頁面時，伺服器會重複搜尋user多次，有N+1問題
        # .includes(:user)可解決此問題

        # @posts = Post.published_posts.order(created_at: :desc).includes(:user)
        # 搜尋條件寫在 post model 中 scope :published_posts, -> { where(status: 'published') }
        # 提升程式碼再用性

        @posts = Post.published.order(created_at: :desc).includes(:user)
        # published為aasm送的方法，能撈出所有 狀態欄位 值 為published的文章，不用自己寫scope
    end

    def show # 單一文章頁面
    end

    def user # 單一使用者文章列表
    end

    def hot # 熱門文章 # 按照文章愛心數排序 已發佈文章
        # 等有愛心欄位後修改
        @posts = Post.published_posts.order(created_at: :desc).includes(:user)
    end

    def rank # 創作者排行榜 # 按照被追蹤數顯示使用者
        # 等有追蹤欄位後修改
        @ranks = User.all
    end

end
