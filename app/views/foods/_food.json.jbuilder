# frozen_string_literal: true

json.extract! food, :id, :name, :created_at, :updated_at
json.url food_url(food, format: :json)
