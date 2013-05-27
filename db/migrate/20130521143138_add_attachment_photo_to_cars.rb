class AddAttachmentPhotoToCars < ActiveRecord::Migration
  def self.up
    change_table :cars do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :cars, :photo
  end
end
