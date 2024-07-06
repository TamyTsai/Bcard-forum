# $ rails g migration add_counter_to_post

class AddCounterToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :love, :integer, default: 0
  end
end

# $ rails db:migrate
# == 20240706035531 AddCounterToPost: migrating =================================
# -- add_column(:posts, :love, :integer, {:default=>0})
#    -> 0.0053s
# == 20240706035531 AddCounterToPost: migrated (0.0053s) ========================