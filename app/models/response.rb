class Response < ApplicationRecord
  has_and_belongs_to_many :action_users
end
