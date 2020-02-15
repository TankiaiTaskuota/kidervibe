# frozen_string_literal: true

json.array! @app_days, partial: 'app_days/app_day', as: :app_day
