class User < ActiveRecord::Base
  has_many :results

  validates_presence_of :name, :last_name, :email

  def to_label
    "#{last_name} #{name}"
  end
end
