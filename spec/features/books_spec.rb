require 'rails_helper'

RSpec.feature "play book", :type => :feature do
  let(:user) { FactoryGirl.create(:user, role: 'admin') }

  # before(:each) do
  #   @book = FactoryGirl.create(:book)
  # end

  def login
    login_as(user, :scope => :user, :run_callbacks => false)
  end

  # scenario "add book" do
  #   login
  #
  #   visit root_path
  #   click_button "Launch demo modal"
  #   within("#exampleModalLong") do
  #       expect(page).to have_content("New Entry Data")
  #       fill_in("book_name", :with => "Swastika")
  #       fill_in("book_number", :with => "0812343321")
  #       click_button ("Submit")
  #   end
  #
  #   expect(page).to have_content("Swastika")
  #
  #   save_and_open_page
  #
  # end

  scenario "edit book" do
    login

    visit root_path
    click_button "Entry new data"
    within("#new") do
        expect(page).to have_content("New Entry Data")
        fill_in("book_name", :with => "Swastika")
        fill_in("book_number", :with => "0812343321")
        click_button ("Submit")
    end

    expect(page).to have_content("Swastika")
    byebug
    click_link "Edit"

    save_and_open_page

  end

  # scenario "destroy book" do
  #   login
  #
  #   visit root_path
  #   click_button "Launch demo modal"
  #   within("#exampleModalLong") do
  #       expect(page).to have_content("New Entry Data")
  #       fill_in("book_name", :with => "Swastika")
  #       fill_in("book_number", :with => "0812343321")
  #       click_button ("Submit")
  #   end
  #
  #   expect(page).to have_content("Swastika")
  #   click_link "Destroy"
  #
  #   save_and_open_page
  #
  # end
end
