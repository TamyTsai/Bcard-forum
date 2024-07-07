# $ rails g model Bookmark user:references post:references

class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end

# $ rails db:migrate
# == 20240707012325 CreateBookmarks: migrating ==================================
# -- create_table(:bookmarks)
#    -> 0.0137s
# == 20240707012325 CreateBookmarks: migrated (0.0137s) =========================