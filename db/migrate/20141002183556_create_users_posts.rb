class CreateUsersPosts < ActiveRecord::Migration
  def change
  		create_table :posts do |t|
  		t.string :title
  		t.string :post
  		t.string :postimgurl
  		t.integer :user_id
  		t.datetime :current
  	end
  end
end
