class CreateWhiskey < ActiveRecord::Migration
  def change
  	create_table :whiskeys do |t|
  		t.string :name
  		t.string :photo_url
  		t.string :flavour
  		t.string :thoughts
  	end
  end
end
