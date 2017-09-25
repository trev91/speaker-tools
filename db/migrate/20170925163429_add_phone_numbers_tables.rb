class AddPhoneNumbersTables < ActiveRecord::Migration[5.1]
  def change
  	create_table :action_phone_numbers do |t|
  		t.string :number  
  		t.boolean :active, default: true
  		t.timestamps		
  	end

  	create_table :action_phone_numbers_users, id:false do |t|
  		t.belongs_to :user, index: true
  		t.belongs_to :action_phone_number, index: true
  		t.timestamps
  	end   	    	
  end
end
