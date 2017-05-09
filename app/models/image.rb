class Image < ApplicationRecord
  belongs_to :childern
  after_create :save_image_from_url

  def save_image_from_url(url=self.image_url)
    if !url.blank?
      if !Dir.exist?("#{IMAGE_PATH}#{self.childern.name}/")
        system("mkdir #{IMAGE_PATH}#{self.childern.name}/")
      end
      img_path = "#{IMAGE_PATH}#{self.childern.name}/#{self.id}"
      system("wget -U 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.6) Gecko/20070802 SeaMonkey/1.1.4' -T 20  --tries=3 '#{url}' -q -O #{img_path}")
      self.update_column(:image_path, img_path) if File.exist?(img_path)
    end
  end
end
