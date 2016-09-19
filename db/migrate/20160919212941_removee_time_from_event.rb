class RemoveeTimeFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :e_time
  end
end
