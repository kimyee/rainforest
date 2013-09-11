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
			fill_in('Price in cents',:with => 100)
			click_button('Submit')
			current_path.should == products_path
			page.should have_content("TEST")
			page.should have_content("TESTING THIS PRODUCT")
			page.should have_content(100)
		end

		it "fills out form incorreclty" do 
			visit root_path
			click_link("New Product")
			current_path.should == new_product_path
			fill_in('Description', :with => "TESTING THIS PRODUCT")
			fill_in('Price in cents',:with => 100)
			click_button('Submit')
			current_path.should == new_product_path

		end
	end
end