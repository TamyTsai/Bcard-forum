class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  # 每個用戶可有多篇文章

  # 寫進資料庫前的後端驗證
  validates :username, presence: :true, uniqueness: true
  # 重複的話 頁面會跳：
  # 1 error prohibited this user from being saved:
  # Username has already been taken

  has_one_attached :avatar
  # 每個使用者可以上傳一個頭貼
end
