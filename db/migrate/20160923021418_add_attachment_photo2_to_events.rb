class AddAttachmentPhoto2ToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :photo2
    end
  end

  def self.down
    remove_attachment :events, :photo2
  end
end
