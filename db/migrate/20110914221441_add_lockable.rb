class AddLockable < ActiveRecord::Migration
	
  change_table(:users) do |t|
  t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
end
  
end
