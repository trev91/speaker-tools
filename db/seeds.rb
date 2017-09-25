# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

roles = ['admin',
		 		'speaker',
		 		'tester']

actions = ['poll',
					'free response',
					'Q&A',
					'drawing',
					'feedback',
					'subscribe']

actions.each do |action|
	new_action = Action.find_or_create_by!(name: action)
end

roles.each do |role|
	new_role = Role.find_or_create_by!(name: role)
end

speaker_user_number = ActionPhoneNumber.find_or_create_by!(number: '801-753-1553')
speaker_user_number.active = true

admin_user = User.find_or_create_by!(email: Rails.application.secrets.admin_email)
admin_user.roles << Role.find_by(name: 'admin')
admin_user.save!


User.find_or_create_by!(email: 'trevor@speaker.com') do |speaker_user|
	speaker_user.first_name = "Trevor"
	speaker_user.first_name = "Hardy"
	speaker_user.password = "password"
	speaker_user.password_confirmation = "password"
	speaker_user.roles << Role.find_by(name: 'speaker')
	speaker_user.action_phone_numbers << speaker_user_number
end

user = User.find(2)
user.actions << Action.find(1)
user_actions = user.actions.first
user.save!

i = 0
10.times do 
	i = i + 1
	response = Response.create!({actions_user_id: 1, content: "I give it a #{i}/10", phone_number: "7028585562"})
	user_actions.responses << response
end

