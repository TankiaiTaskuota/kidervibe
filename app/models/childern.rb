class Childern < ApplicationRecord

  has_many :app_days
  has_many :food_activities
  has_many :images


  def get_by_day_info(day=Date.today)
    require "net/http"
    require "uri"

    uri = URI.parse("http://kindervibe.com/api/activity/day/?child_pk=#{self.app_id}&date=#{day}")
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Get.new(uri.request_uri)
    request["Authorization"] = " Token #{SUPER_SECRET_TOKEN}"
    request["Accept"] = "*/*"

    response = http.request(request)
    parsed_response = JSON.parse(response.body)
    Rails.logger.info parsed_response.to_yaml

    if !parsed_response['theme'].blank? or !parsed_response['comment'].blank? or !parsed_response['food'].blank? or parsed_response['photos'].size.to_i > 0


      app_day = self.app_days.find_or_create_by(:created_at => "#{day} 00:00:00")
      if app_day
        app_day.thema = parsed_response['theme']
        app_day.food = parsed_response['food']
        app_day.sleep = parsed_response['sleep']
        app_day.outdoors = parsed_response['outdoors']
        app_day.comment = parsed_response['comment']
        app_day.save if !app_day.new_record?
      end

      parsed_response['foodactivity'].each { |f|
        food = Food.find_or_create_by(name: f['comment'])
        if food
          food_activity = self.food_activities.where(food: food, :created_at => "#{day} 00:00:00").first
          if !food_activity
            food_activity = self.food_activities.create(food: food, :created_at => "#{day} 00:00:00")
          end
          food_activity.percentage = f['percent']
          food_activity.food_type = Food.nice_types(f['type_id'])
          food_activity.save
        end

      }

      parsed_response['photos'].each { |photo|
        image = self.images.where(image_url: photo['photo'], :created_at => "#{day} 00:00:00").first
        if !image
          self.images.create(image_url: photo['photo'], :created_at => "#{day} 00:00:00", comment: photo['comment'], :app_id=>photo['photo'].to_s.split('/').last.to_s.split('.').first, :ext=>photo['photo'].to_s.split('.').last)
        end
      }
    end


  end


end
