# $ rails g migration add_columns_to_users username:uniq intro:text
#       invoke  active_record
#       create    db/migrate/20240703105643_add_columns_to_users.rb

class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :users, :intro, :text
  end
end

# $ rails db:migrate
# == 20240703105643 AddColumnsToUsers: migrating ================================
# -- add_column(:users, :username, :string)
#    -> 0.0011s
# -- add_index(:users, :username, {:unique=>true})
#    -> 0.0016s
# -- add_column(:users, :intro, :text)
#    -> 0.0004s
# == 20240703105643 AddColumnsToUsers: migrated (0.0032s) =======================