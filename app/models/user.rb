class User < ActiveRecord::Base
  has_many :results

  validates_presence_of :name
  validates_length_of :name, :maximum => 15

  def to_label
    "#{last_name} #{name}"
  end
end
