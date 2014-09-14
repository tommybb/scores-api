class User < ActiveRecord::Base
  has_many :results

  def to_label
    "#{last_name} #{name}"
  end
end
