class AddCountCacheToCandidate < ActiveRecord::Migration[6.0]
  def change
add_column :candidates, :vote_logs_count, :integer, default: 0
  end
end
