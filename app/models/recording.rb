class Recording < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  has_attached_file :audioclip
  validates_attachment_presence :audioclip
  validates_attachment_content_type :audioclip,
      content_type: %w(audio/mpeg audio/x-mpeg audio/mp3 audio/x-mp3 audio/mpeg3 audio/x-mpeg3 audio/mpg audio/x-mpg audio/x-mpegaudio)
  validates_attachment_size :audioclip, less_than: 100.megabytes
end
