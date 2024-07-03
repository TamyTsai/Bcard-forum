# $ rails g model Post title content:text status user:references

class Post < ApplicationRecord

  include AASM

  belongs_to :user

  validates :title, presence: true

  default_scope { where(deleted_at: nil) }
  # 系統中所有查詢都會套用此篩選
  # 3.0.0 :002 > Post.all
  # Post Load (0.6ms)  SELECT "posts".* FROM "posts" WHERE "posts"."deleted_at" IS NULL /* loading for pp */ LIMIT $1  [["LIMIT", 11]]

  # 覆寫既有的destroy方法（變成軟刪除）
  def destroy
    update(deleted_at: Time.now)
  end

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

end
