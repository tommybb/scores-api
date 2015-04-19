class Result < ActiveRecord::Base
  belongs_to :user
  belongs_to :competition

  validates_presence_of :score
end
