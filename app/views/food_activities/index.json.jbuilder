# frozen_string_literal: true

json.array! @food_activities, partial: 'food_activities/food_activity', as: :food_activity
