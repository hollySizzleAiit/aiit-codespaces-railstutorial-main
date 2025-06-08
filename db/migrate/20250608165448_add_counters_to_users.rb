class AddCountersToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :followers_count, :integer, default: 0, null: false
    add_column :users, :following_count, :integer, default: 0, null: false

    # 既存のレコードのカウンターを更新
    reversible do |dir|
      dir.up do
        User.reset_column_information
        User.all.each do |user|
          User.update_counters user.id,
                               followers_count: user.followers.count,
                               following_count: user.following.count
        end
      end
    end
  end
end
