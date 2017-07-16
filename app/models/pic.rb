class Pic < ApplicationRecord
  belongs_to :bicycle, touch: true

  # Mount carrierwave picture uploader
  mount_uploader :image, PicUploader

  # Callbacks
  before_create :default_name

  # Returns the default name fo a picture
  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end

end
