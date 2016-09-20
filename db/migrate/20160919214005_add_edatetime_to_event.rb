class AddEdatetimeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :e_datetime, :datetime
  end
end
