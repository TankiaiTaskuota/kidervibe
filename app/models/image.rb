# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :childern
  after_create :save_image_from_url

  delegate :name, to: :childern

  def save_image_from_url(url = image_url)
    return if url.blank?

    make_dir unless Dir.exist?("#{IMAGE_PATH}#{name}/")

    system("wget -U 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.6) Gecko/20070802 SeaMonkey/1.1.4' -T 20  --tries=3 '#{url}' -q -O #{img_path}")

    update_column(:image_path, img_path) if File.exist?(img_path)
  end

  def make_dir
    system("mkdir #{IMAGE_PATH}#{name}/")
  end

  def img_path
    "#{IMAGE_PATH}#{name}/#{id}"
  end
end
