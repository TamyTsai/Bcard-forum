# $ rails g model Post title content:text status user:references

class Post < ApplicationRecord

  # 有限狀態機套件
  include AASM

  # 友善ID套件
  extend FriendlyId
  # friendly_id :要被當作slug用的欄位名稱, use: :slugged
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
  # 動態長出 user 與 user= 實體方法
  has_one_attached :cover_image
  # 每篇文章都可以有一個封面照片
  # Active Storage

  # 搜尋條件範圍
  # default_scope { where(deleted_at: nil) } ＃改用paranoia套件
  # 系統中所有查詢都會套用此篩選
  # 3.0.0 :002 > Post.all
  # Post Load (0.6ms)  SELECT "posts".* FROM "posts" WHERE "posts"."deleted_at" IS NULL /* loading for pp */ LIMIT $1  [["LIMIT", 11]]

  # scope :published_posts, -> { where(status: 'published') }
  # 按 建立順序 顯示的 已發佈文章
  scope :published_posts_created_at, -> { published.with_attached_cover_image.order(created_at: :desc).includes(:user) }
  # published為aasm送的方法，能撈出所有 狀態欄位 值 為published的文章

  # 按 愛心數順序 顯示的 已發佈文章（待修改）
  scope :published_posts_love, -> { published.with_attached_cover_image.order(updated_at: :desc).includes(:user) }
  

  # 實體方法（belongs_to是類別方法）
  # 覆寫既有的destroy方法（變成軟刪除）
  # def destroy
  #   update(deleted_at: Time.now)
  # end
  # 改用paranoia套件

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

  # 直接改欄位值的話...
  # 3.0.0 :002 > p1.update(status: 'publish')
  # (irb):2:in `<main>': direct assignment of AASM column has been disabled (see AASM configuration for this class) (AASM::NoDirectAssignmentError)

  private

  def slug_post # 文章 給friendly id 用的slug
    [
      :title, # 文章標題
      [:title, SecureRandom.hex[0, 8]] # 為同名文章產生 另外 的 網址編號
    ]
  end
  # http://localhost:3000/posts/文章標題-b3e5f0e8/edit


end
