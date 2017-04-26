class Food < ApplicationRecord

  def Food.nice_types(string)
    case string
      when 'BREAKFAST'
        1
      when 'DINNER'
        2
      when 'SUPPER'
        3
      else
        0
    end
  end
end
