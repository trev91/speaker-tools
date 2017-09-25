class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles
  has_and_belongs_to_many :action_phone_numbers
  has_and_belongs_to_many :actions

	def role
		self.roles.first
	end

	def responses
		actions = self.actions
		responses = []
		actions.each do |action|
			responses << action.responses
		end
		return responses
	end

	def active_action_phone_numbers
		self.action_phone_numbers.where(active:true)
	end

end
