class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 寫進資料庫前的後端驗證
  validates :username, presence: :true, uniqueness: true
  # 重複的話 頁面會跳：
  # 1 error prohibited this user from being saved:
  # Username has already been taken
  
  # 資料表間的關聯
  has_many :posts
  # 每個用戶可有多篇文章
  has_many :follows # follows為資料表名稱
  # 每個用戶可有多位追蹤者
  has_one_attached :avatar
  # 每個使用者可以上傳一個頭貼

  # 實體方法
  def follow?(user) # 有無追蹤user  # 作用在 使用者實體 上 的 實體方法
    # follows.where(following: user) # 會回傳陣列 比較浪費資源
    follows.exists?(following: user)
    # 在follows表格中 傳進來的參數user 是否存在於 following欄位 中
    # 回傳布林值
  end

  def follow!(user) # 追蹤或取消追蹤user 
    # 到資料表改資料
    if follow?(user) # 已經追蹤->取消追蹤
      follows.find_by(following: user).destroy
      # 找到follows資料表中 following欄位值 為 傳入之參數user 的資料 並刪除
      return '已取消追蹤'
    else # 還沒追蹤->追蹤
      follows.create(following: user)
      return '已追蹤'
    end
  end

end
