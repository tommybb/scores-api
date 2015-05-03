class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :results

  validates_presence_of :name, :last_name, :email

  def to_label
    "#{last_name} #{name}"
  end
end
