# $ rails g model Bookmark user:references post:references

class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
