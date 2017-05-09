json.extract! post, :id, :app_id, :attachment_url, :info, :created_at, :updated_at
json.url post_url(post, format: :json)
