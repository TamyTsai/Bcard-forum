# $ rails g migration add_cardname_to_users cardname
#       invoke  active_record
#       create    db/migrate/20240703111419_add_cardname_to_users.rb

class AddCardnameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :cardname, :string
  end
end

# $ rails db:migrate
# == 20240703111419 AddCardnameToUsers: migrating ===============================
# -- add_column(:users, :cardname, :string)
#    -> 0.0010s
# == 20240703111419 AddCardnameToUsers: migrated (0.0010s) ======================

