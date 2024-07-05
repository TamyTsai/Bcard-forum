# $ rails g model Comment user:references post:references content:text deleted_at:datetime:index

class Comment < ApplicationRecord

  acts_as_paranoid

  belongs_to :user
  belongs_to :post

  validates :content, presence: true
end
