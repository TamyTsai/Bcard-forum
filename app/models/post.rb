# $ rails g model Post title content:text status user:references

class Post < ApplicationRecord

  # 有限狀態機套件
  include AASM

  # 友善ID套件
  extend FriendlyId
  # friendly_id :給friendly id 用的slug, use: :slugged
  friendly_id :slug_post , use: :slugged

  # 軟刪除套件
  acts_as_paranoid
  # 覆寫destroy方法
  # 增加預設搜尋條件
  # destroy後rails c看不到，但尚存在於資料庫

  # 表單送出後 寫進資料庫前 之 後端驗證
  validates :title, presence: true
  
  # 資料間關聯
  belongs_to :user
  # 動態長出 user 與 user= 方法
  has_many :comments, dependent: :destroy # 刪除一篇文章，其相關的留言也需要被刪除，否則它們只會佔用資料庫空間
  # 動態長出 comments comments= build create 方法
  has_many :bookmarks, dependent: :destroy
  # 動態長出 bookmarks bookmarks= build create 方法
  has_one_attached :cover_image
  # 每篇文章都可以有一個封面照片
  # Active Storage

  # 搜尋條件範圍
  scope :published_posts, -> { where(status: 'published') }
  # 按 建立順序 顯示的 已發佈文章
  scope :published_posts_created_at, -> { published.with_attached_cover_image.order(created_at: :desc).includes(:user) }
  # published為aasm送的方法，能撈出所有 狀態欄位 值 為published的文章

  # 按 愛心數順序 顯示的 已發佈文章
  scope :published_posts_love, -> { published.with_attached_cover_image.order(love: :desc).includes(:user) }
  

  # 實體方法
  def bookmark?(user) # 文章 有無被 某user 收藏  # 作用在 文章實體 上 的 實體方法
    bookmarks.exists?(user: user)
    # 在bookmarks表格中 傳進來的參數user 是否存在於 user_id欄位 中
    # 回傳布林值
  end

  def bookmark!(user) # 被user收藏或取消收藏
    # 到資料表改資料
    if bookmark?(user) # 已經被收藏->取消收藏
      bookmarks.find_by(user: user).destroy
      # 找到bookmarks資料表中 user_id欄位值 為 傳入之參數user 的資料 並刪除
      return '已被取消收藏'
    else # 還沒被收藏->被收藏
      bookmarks.create(user: user)
      return '已被收藏'
    end
  end

  def normalize_friendly_id(input) # babosa方法 轉換文字編碼
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
  # http://localhost:3000/posts/文章中文標題/edit

  
  aasm(column: 'status', no_direct_assignment: true) do 
  # 預設會去找aasm_state欄位 以(column: 'status')更改預設
  # 不允許直接更動欄位值 只能透過狀態機轉換方法改
    state :draft, initial: true # 初始狀態
    state :published

    event :publish do # 發佈文章
      transitions from: :draft, to: :published
      # after do
      #   puts "發簡訊通知"
      # end
    end

    event :unpublish do # 下架文章
      transitions from: :published, to: :draft
    end

  end
  # 長出方法
  # draft? published? may_publish? may_unpublish? publish! unpublish!

  private

  def slug_post # 文章 給friendly id 用的slug
    [
      :title, # 文章標題
      [:title, SecureRandom.hex[0, 8]] # 為同名文章產生 另外 的 網址編號
    ]
  end
  # http://localhost:3000/posts/文章標題-b3e5f0e8/edit


end
