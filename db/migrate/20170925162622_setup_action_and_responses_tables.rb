class SetupActionAndResponsesTables < ActiveRecord::Migration[5.1]
  def change
  	create_table :actions do |t|
  		t.string :name  		
  	end
  	create_table :responses do |t|
  		t.string :content
  		t.string :phone_number
  		t.belongs_to :actions_user
  		t.timestamps		
  	end
  	create_table :actions_responses do |t|
  		t.belongs_to :response, index: true
  		t.belongs_to :action, index: true
  		t.timestamps
  	end
  	create_table :actions_users do |t|
  		t.belongs_to :user, index: true
  		t.belongs_to :action, index: true
  		t.timestamps
  	end  	
  end
end
