class Post < ApplicationRecord
  after_create :save_from_url

  def save_from_url(url=self.attachment_url)
    if !url.blank?
      if !Dir.exist?("#{IMAGE_PATH}Files/")
        system("mkdir #{IMAGE_PATH}Files/")
      end
      img_path = "#{IMAGE_PATH}Files/#{self.id}"
      system("wget -U 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.6) Gecko/20070802 SeaMonkey/1.1.4' -T 20  --tries=3 '#{url}' -q -O #{img_path}")
    end
  end

  def Post.get_info(url="http://kindervibe.com/api/posts/threads/")
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Get.new(uri.request_uri)
    request["Authorization"] = " Token #{SUPER_SECRET_TOKEN}"
    request["Accept"] = "*/*"

    response = http.request(request)

    parsed_response = JSON.parse(response.body)
    parsed_response['results'].each { |r|


      uri2 = URI.parse("http://kindervibe.com/api/posts/get/?thread_id=#{r['id']}")
      http2 = Net::HTTP.new(uri2.host, uri2.port)

      request2 = Net::HTTP::Get.new(uri2.request_uri)
      request2["Authorization"] = " Token #{SUPER_SECRET_TOKEN}"
      request["Accept"] = "*/*"

      response2 = http2.request(request2)
      mesages = JSON.parse(response2.body)
      mesages.each { |p|
        post = Post.where(post_app_id: p['id']).first
        if !post
          Post.create(thread_app_id: r['id'], post_app_id: p['id'], :created_at => p['created_at'], :attachment_url => p['attachment'], :info => p['body'], sender_name: p['sender_name'], sender_app_id: p['sender'])
        end
      }
    }
    if !parsed_response['next'].blank?
      Post.get_info(parsed_response['next'])
    end
  end

end
