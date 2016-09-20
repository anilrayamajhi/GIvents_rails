class RemoveeDateFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :e_date
  end
end
