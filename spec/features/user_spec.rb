require 'spec_helper'

describe "user" do 
	context 'creates new product' do
		it "clicks link for new product" do
			visit root_path
			click_link("New Product")
		end
		
		it "fills out form for new product" do
			visit root_path
			click_link("New Product")
			current_path.should == new_product_path
			fill_in('Name', :with => "TEST")
			fill_in('Description', :with => "TESTING THIS PRODUCT")
			fill_in('Price_in_cents',:with => 100)
			click('Submit')
		end
	end
end