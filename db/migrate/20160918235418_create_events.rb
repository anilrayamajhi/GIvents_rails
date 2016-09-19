class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :e_name
      t.string :e_address
      t.date :e_date
      t.time :e_time
      t.text :e_description

      t.timestamps null: false
    end
  end
end
