# $ rails g migration add_slug_to_post slug:uniq
# invoke  active_record
# create    db/migrate/20240703101319_add_slug_to_post.rb

class AddSlugToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :slug, :string
    add_index :posts, :slug, unique: true
  end
end

# $ rails db:migrate
# == 20240703101319 AddSlugToPost: migrating ====================================
# -- add_column(:posts, :slug, :string)
#    -> 0.0013s
# -- add_index(:posts, :slug, {:unique=>true})
#    -> 0.0016s
# == 20240703101319 AddSlugToPost: migrated (0.0030s) ===========================