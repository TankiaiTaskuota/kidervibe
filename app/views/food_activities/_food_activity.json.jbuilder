# frozen_string_literal: true

json.extract! food_activity, :id, :childern_id, :food_id, :food_type, :percentage, :created_at, :updated_at
json.url food_activity_url(food_activity, format: :json)
