class ChangeCompletedBoolean < ActiveRecord::Migration
  def change
  
    def up
      change_column :goals, :completed, :boolean, default: false
    end

    def down
      change_column :goals, :completed, :boolean, default: nil
    end
  end
end
