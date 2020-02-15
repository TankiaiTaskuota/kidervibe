# frozen_string_literal: true

json.extract! image, :id, :childern_id, :comment, :app_id, :image_url, :image_path, :ext, :created_at, :updated_at
json.url image_url(image, format: :json)
