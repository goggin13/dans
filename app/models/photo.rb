require "open-uri"

class Photo < ActiveRecord::Base
  attr_accessor :url
  attr_accessible :caption, :image, :url
  has_attached_file :image,
    :styles => {
      :medium_square => "300x300#",
      :small_square => "100x100#",
      :medium => "300x300>",
      :small => "100x100>"
    },
    :default_url => "/images/:style/missing.png"

  def image_from_url(url)
    self.image = open(url)
  end
end
