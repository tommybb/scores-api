class Result < ActiveRecord::Base
  belongs_to :user
  belongs_to :competition

  def bump(value)
    self.score += value
  end
end
