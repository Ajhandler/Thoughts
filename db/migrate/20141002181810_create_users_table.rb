class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :fname
  		t.string :lname
  		t.string :email
  		t.string :username
  		t.string :password
  		t.string :userimgurl
  	end
  end
end
