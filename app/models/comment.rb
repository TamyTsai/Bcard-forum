# $ rails g model Comment user:references post:references content:text deleted_at:datetime:index

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
