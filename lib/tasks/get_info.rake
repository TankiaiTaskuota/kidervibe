namespace :get_info do
  desc "Download data from server"
  task :all => :environment do
    start_date = ENV['start_date'] ? Date.parse(ENV['start_date']) : Date.today
    end_date = ENV['end_date'] ? Date.parse(ENV['end_date']) : Date.today

    childerns = Childern.all
    (start_date..end_date).each do |day|
      puts day
      childerns.each { |c| c.get_by_day_info(day) }
    end

    Post.get_info
  end

  task :download_images => :environment do
    Image.where('id > 3553 and id < 3765').all.each { |i|
      #if !i.image_url.blank? and i.image_path.blank?
      puts "***#{Time.now} : #{i.id} => #{i.image_url}"
      i.save_image_from_url
      sleep(rand(10))
      # end
    }
  end


  task :posts => :environment do
    Post.get_info
  end

end
