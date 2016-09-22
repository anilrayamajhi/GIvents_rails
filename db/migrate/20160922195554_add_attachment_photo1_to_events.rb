class AddAttachmentPhoto1ToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :photo1
    end
  end

  def self.down
    remove_attachment :events, :photo1
  end
end
