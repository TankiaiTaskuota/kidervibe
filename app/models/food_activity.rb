# frozen_string_literal: true

class FoodActivity < ApplicationRecord
  belongs_to :childern
  belongs_to :food
end
