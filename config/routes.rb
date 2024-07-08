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

  # 文章CRUD
  resources :posts do
    # 文章留言
    # /posts/:post_id/comments/:id
    resources :comments, only: [:create, :edit, :update, :destroy]
    # post_comments     POST   /posts/:post_id/comments(.:format)                  comments#create
    # edit_post_comment GET    /posts/:post_id/comments/:id/edit(.:format)         comments#edit
    # post_comment      PATCH  /posts/:post_id/comments/:id(.:format)              comments#update
    #                   PUT    /posts/:post_id/comments/:id(.:format)              comments#update
    # post_comment      DELETE /posts/:post_id/comments/:id(.:format)              comments#destroy
  end

  # 單篇文章頁面
  # /@ID/文章標題-123
  # post_page    GET    /@:username/:post_id(.:format)        pages#show
  get '@:username/:post_id', to: 'pages#show', as: 'post_page'
  # prefix設定為 post_page（不設定就沒有prefix可以用）
  # 不想額外生一個controller，所以就指定用pages controller
  # :username 是符號，冒號不會出現在網址

  # 單一使用者文章列表
  # /@ID
  # user_page   GET    /@:username(.:format)           pages#user
  get '@:username', to: 'pages#user', as: 'user_page'

  # 熱門文章
  # hot_page   GET    /hot(.:format)              pages#hot
  get 'hot', to: 'pages#hot', as: 'hot_page'

  # 創作者排行榜
  # rank_page   GET    /rank(.:format)      pages#rank
  get 'rank', to: 'pages#rank', as: 'rank_page'

  # api相關路徑
  namespace :api do
    namespace :v1 do

      # 追蹤使用者功能 的 api
      # follow_api_v1_user    POST   /api/v1/users/:id/follow(.:format)       api/v1/users#follow
      resources :users, only: [] do
      # 想要網址帶users 但users的CRUD都被devise做完，所以這裡給空陣列，單純用來生成 追蹤使用者功能 的 api路徑
        member do
          post :follow
        end
      end

      resources :posts, only: [] do
        member do
          # 為文章按愛心功能 的 api
          # love_api_v1_post   POST   /api/v1/posts/:id/love(.:format)    api/v1/posts#love
          post :love
          # 收藏文章功能 的 api
          # bookmark_api_v1_post    POST   /api/v1/posts/:id/bookmark(.:format)      api/v1/posts#bookmark
          post :bookmark
        end
      end

      # 用Froala editor上傳圖片功能 的 api
      # api_v1_upload_image    POST   /api/v1/upload_image(.:format)        api/v1/utils#upload_image
      post :upload_image, to: 'utils#upload_image'

    end
  end

  namespace :my do
    # 個人資料首頁：我的收藏
    # my_root   GET    /my(.:format     my/profile#collections
    root 'profiles#collections'
    # 我的收藏
    # my_collections_page    GET    /my/collections(.:format)           my/profile#collections
    get 'collections', to: 'profiles#collections', as: 'collections_page'
    # 我的追蹤的使用者
    # my_following_page   GET    /my/following(.:format)            my/profile#following
    get 'following', to: 'profiles#following', as: 'following_page'
  end
  
end

