Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # devise_for :users #devise幫你長出來的 會自動對應該對應的controller

  # 有自己生成controller（rails g devise:controllers 資料夾名稱），客製化的部分要來此設定
  devise_for :users, controllers: {
    registrations: 'users/registrations' # 有關會員註冊（註冊及編輯資料）的controller 請使用users資料夾下的registrations_controlle.rb
  }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # 首頁：不分類所有已發佈文章列表
  # Defines the root path route ("/")
  root "pages#index"

  resources :posts

  # 文章
  # resources :posts do
  #   resources :comments, only: [:create] # 每篇文章下會有很多留言，直接把留言路徑資源做在文章下
  #   # 只會用到create action的相關路徑（只需要新增留言）
  #   # rails routes | grep comments
  #   # 只長出  article_comments   POST   /articles/:article_id/comments(.:format)      comments#create
  # end
 
  # 個人資訊：/my
  # namespace :my do
  #   # 個人資料首頁：我的收藏文章列表
  #   root 'collections#index' # 本namespace的首頁設定在 我的收藏

  #   # 我的收藏：/my/collections
  #   get '/collections', to: 'collections#index' # 我的收藏文章列表
   
  #   # 我追蹤的卡稱：/my/following
  #   get '/following', to: 'followings#index'  # 我追蹤的卡稱列表

  #   # 我的文章（所有文章）：/my/posts
  #   # get '/posts', to: 'posts#index' # 我的所有文章列表

  #   # 編輯我的個人資料：/users/edit（devise預設）
  #   # edit_user_registration GET    /users/edit(.:format)    devise/registrations#edit  編輯帳號資料（編輯帳號資料表單頁面）

  # end
  
#   # 單一用戶的已發佈文章列表：/@用戶ID（username）
#   get '@:username', to: 'pages#user', as: 'user_page'

#   # 某一使用者 的 某一篇文章
#   # /@用戶ID（username）/文章標題-123
#   get '@:username/:article_id', to: 'pages#show', as: 'article_page'
#   # 當網址於@:username/:article_id，且使用get方法，就使用 pages controller的show action
#   # prefix前綴 為article_page
#   # story_page  GET   /@:username/:article_id(.:format)      pages#show

#   # 愛心、追蹤、收藏 等 api功能
#   namespace :api do
#     namespace :v1 do # 這樣之後有v2時，可以跟v1共存

#       # 追蹤其他用戶功能 之api
#       # /api/v1/users/:id/follow  
#       resources :users, only:[] do
#         member do 
#           post :follow
#         end
#       end
#       # follow_user    POST   /users/:id/follow(.:format)     users#follow
#       # 因users的CRUD devise已經幫我們做好，故 only:[] 接空陣列 表示 與users有關的8條路徑7個方法都不要做
#       # 我們只需要/users/:id/follow路徑
#       # 要被follow功能api打的路徑
#       # 加上namespace api後
#       # follow_api_user   POST   /api/users/:id/follow(.:format)    api/users#follow
      
#       resources :articles, only:[] do
#         member do
#           # 為文章按愛心功能 之api
#           # /api/v1/f/:id/love 
#           post :love
#           # html動詞 :action

#           # 收藏文章功能 之api
#           # /api/v1/f/:id/bookmark
#           post :bookmark
#         end
#         # 幫原本的8條路徑再擴充其他路徑（帶id）
#         # post比較不容易被仿造（會檢查token） get只要知道路徑 就可以灌票
#         # 要被愛心功能api打的路徑
#       end
      
#       # 留言上傳圖片功能 之api
#       # /api/v1/upload_image      
#       post :upload_image, to: 'utils#upload_image'
#       # 在name space api底下 擴充 upload_image路徑（不帶id），並指定 此路徑 對應 utils controller 的 upload_image action
#       # api_upload_image   POST   /api/upload_image(.:format)      api/utils#upload_image
#     end
#   end
  
end

# 路徑清單(20240702 1150)（待修改 articles應該要是自己文章列表）
  #                    root    GET    /                                                  articles#index  首頁：所有已發佈文章列表
  #        article_comments    POST   /articles/:article_id/comments(.:format)           comments#create  留言建立（送出留言表單）
  #                articles    GET    /articles(.:format)                                articles#index  所有已發佈文章列表
  #                            POST   /articles(.:format)                                articles#create  文章 之 建立（送出 新增表單）
  #             new_article    GET    /articles/new(.:format)                            articles#new   新增文章（新增 文章表單輸入頁面）
  #            edit_article    GET    /articles/:id/edit(.:format)                       articles#edit  文章 之 編輯（編輯 文章表單輸入頁面）
  #                 article    GET    /articles/:id(.:format)                            articles#show  單一文章顯示
  #                            PATCH  /articles/:id(.:format)                            articles#update  文章 之 更新（送出 編輯表單）
  #                            PUT    /articles/:id(.:format)                            articles#update  文章 之 更新（送出 編輯表單
  #                            DELETE /articles/:id(.:format)                            articles#destroy  文章 之 刪除

  #                 my_root    GET    /my(.:format)                                      my/collections#index  個人資料首頁：我的收藏文章列表
  #          my_collections    GET    /my/collections(.:format)                          my/collections#index  我的收藏文章列表
  #            my_following    GET    /my/following(.:format)                            my/followings#index  我追蹤的用戶列表
  #                my_posts    GET    /my/posts(.:format)                                my/posts#index  我的所有文章列表

  #               user_page    GET    /@:username(.:format)                              pages#user  單一用戶的已發佈文章列表

  #      follow_api_v1_user    POST   /api/v1/users/:id/follow(.:format)                 api/v1/users#follow  追蹤其他用戶功能 之api
  #     love_api_v1_article    POST   /api/v1/articles/:id/love(.:format)                api/v1/articles#love  為文章按愛心功能 之api
  # bookmark_api_v1_article    POST   /api/v1/articles/:id/bookmark(.:format)            api/v1/articles#bookmark  收藏文章功能 之api
  #     api_v1_upload_image    POST   /api/v1/upload_image(.:format)                     api/v1/utils#upload_image  留言上傳圖片功能 之api

  #           new_user_session GET    /users/sign_in(.:format)                           devise/sessions#new  登入
  #               user_session POST   /users/sign_in(.:format)                           devise/sessions#create  送出 登入表單
  #       destroy_user_session DELETE /users/sign_out(.:format)                          devise/sessions#destroy  登出
  #          new_user_password GET    /users/password/new(.:format)                      devise/passwords#new  建立新密碼（建立密碼表單頁面）
  #         edit_user_password GET    /users/password/edit(.:format)                     devise/passwords#edit  修改密碼（修改密碼表單頁面）
  #              user_password PATCH  /users/password(.:format)                          devise/passwords#update  更新密碼（送出 修改密碼表單）
  #                            PUT    /users/password(.:format)                          devise/passwords#update  更新密碼（送出 修改密碼表單）
  #                            POST   /users/password(.:format)                          devise/passwords#create  建立新密碼（送出 建立密碼表單頁面）

  #   cancel_user_registration GET    /users/cancel(.:format)                            devise/registrations#cancel
  #      new_user_registration GET    /users/sign_up(.:format)                           devise/registrations#new   註冊新帳號（註冊表單頁面）
  #     edit_user_registration GET    /users/edit(.:format)                              devise/registrations#edit  編輯帳號資料（編輯帳號資料表單頁面）
  #          user_registration PATCH  /users(.:format)                                   devise/registrations#update  更新帳號資料（送出 編輯帳號表單）
  #                            PUT    /users(.:format)                                   devise/registrations#update  更新帳號資料（送出 編輯帳號表單）
  #                            DELETE /users(.:format)                                   devise/registrations#destroy  刪除既有帳號
  #                            POST   /users(.:format)                                   devise/registrations#create  註冊新帳號（送出 註冊表單）

