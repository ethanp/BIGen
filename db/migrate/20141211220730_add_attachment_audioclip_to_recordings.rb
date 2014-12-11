class AddAttachmentAudioclipToRecordings < ActiveRecord::Migration
  def self.up
    change_table :recordings do |t|
      t.attachment :audioclip
    end
  end

  def self.down
    remove_attachment :recordings, :audioclip
  end
end
