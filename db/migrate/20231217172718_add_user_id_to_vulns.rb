class AddUserIdToVulns < ActiveRecord::Migration[7.0]
  def change
    add_column :vulns, :user_id, :integer
    add_index :vulns, :user_id
  end
end
