class User < ActiveRecord::Base
  validates_uniqueness_of :email

	has_many :events
  has_many :venues
	has_many :permissions
	has_many :roles, through: :permissions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
