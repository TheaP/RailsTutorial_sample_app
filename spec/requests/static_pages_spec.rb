require 'spec_helper'

describe "StaticPages" do
  
	describe "Home page" do

		it "should have the content 'Neonate Connect'" do
			visit '/static_pages/home'
			expect(page).to have_content('Neonate Connect')
		end

		it "should have the title 'Neonate Connect'" do
			visit '/static_pages/home'
			expect(page).to have_title('Neonate Connect | Home')
		end
	end	

	describe "About" do

		it "should have the content 'About'" do
			visit '/static_pages/about'
			expect(page).to have_content('About')
		end

		it "should have the title 'About'" do
			visit '/static_pages/about'
			expect(page).to have_title('Neonate Connect | About')
		end

	end

	describe "Contact" do

		it "should have the content 'Contact'" do
			visit '/static_pages/contact'
			expect(page).to have_content('Contact')
		end

		it "should have the title 'Contact Us'" do
			visit '/static_pages/contact'
			expect(page).to have_title('Neonate Connect | Contact Us')
		end
	end

end
