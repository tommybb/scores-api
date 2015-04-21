class Result < ActiveRecord::Base
  belongs_to :user
  belongs_to :competition

  validates_presence_of :score, :result_date, :user_id, :competition_id
end
