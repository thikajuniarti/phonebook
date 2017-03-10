require 'rails_helper'

RSpec.feature "play book", :type => :feature do
  let(:user) { FactoryGirl.create(:user) }
  let!(:book) { FactoryGirl.create(:book, user: user) }

  # def create
  #   login_as(user)
  #
  #   visit root_path
  #   click_link "Entry new data"
  #
  #   within('#book-modal', visible: true) do
  #     expect(page).to have_content("New Entry Data")
  #     fill_in("book_name", :with => "Tikah")
  #     fill_in("book_number", :with => "08123444311")
  #     click_button "Submit"
  #   end
  # end

  # it "create book", js: true do
  #   create
  #
  #   expect(page).to have_content("Tikah")
  #
  #   save_and_open_page
  # end

  def update
    login_as(user)

    visit root_path
    expect(page).to have_content("Swastika")
    click_link "Edit"

    within('#book-modal', visible: true) do
      expect(page).to have_content("Edit Data")
      fill_in("book_name", :with => "Tikah")
      click_button "Submit"
    end
  end

  it "edit book", js: true do
    update
    book.reload
    # expect(book.name).to eq("Tikahhh")

    save_and_open_page
  end

  # it "destroy book", js: true do
  #   login_as(user)
  #
  #     visit root_path
  #     expect(page).to have_content("Swastika")
  #     click_link "Destroy"
  #
  #   save_and_open_page
  # end
end
