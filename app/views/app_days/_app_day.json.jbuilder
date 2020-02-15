# frozen_string_literal: true

json.extract! app_day, :id, :childern_id, :comment, :thema, :outdoors, :sleep, :food, :created_at, :updated_at
json.url app_day_url(app_day, format: :json)
