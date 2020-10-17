class CreateContacts < ActiveRecord::Migration[6.0]
  def change
  	create_table :contacts do |t|
  		t.text :name
  		t.text :useremail
  		t.text :question
 
   		t.timestamps
	 end
 end
end
