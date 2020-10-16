class CreateBarbers < ActiveRecord::Migration[6.0]
  def change
  	create_table :barbers do |t|
  		t.text :name
  		t.timestamps
  	end

  	Barber.create :name => 'Jessie Pinkman'
  	Barber.create :name => 'Sergo Bandit'
  	Barber.create :name => 'Nusk'

  end
end
