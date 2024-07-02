# $ rails g model Post title content:text status user:references

class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
end
