class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships, :id => false do |t|
      t.integer :self_id
      t.integer :friend_id
    end
    add_index :friendships, :self_id
    add_index :friendships, :friend_id
    add_index :friendships, [:self_id, :friend_id], unique: true
  end
end
