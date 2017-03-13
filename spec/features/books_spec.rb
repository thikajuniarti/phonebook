require 'rails_helper'

RSpec.feature "play book", :type => :feature do
  let(:user) { FactoryGirl.create(:user) }
  let!(:book) { FactoryGirl.create(:book, user: user) }

  it "sign up" do
    visit root_path
    click_link "Sign Up Here"

    fill_in("user_email", :with => "junie@gmail.com")
    fill_in("user_password", :with => user.password)
    fill_in("user_password_confirmation", :with => user.password_confirmation)

    click_button "Sign up"

    expect(page).to have_content("junie@gmail.com")

    save_and_open_page
  end

  it "sign in" do
    visit root_path

    fill_in("user_email", :with => user.email)
    fill_in("user_password", :with => user.password)

    click_button "Sign in"

    expect(page).to have_content(user.email)

    save_and_open_page
  end

  it "create book with valid attribute", js: true do
    login_as(user)

    visit root_path
    click_link "Entry new data"

    within('#book-modal', visible: true) do
      expect(page).to have_content("New Entry Data")
      fill_in("book_name", :with => "Tikah")
      fill_in("book_number", :with => "08123444311")
      click_button "Submit"
    end

    expect(page).to have_content("Tikah")

    save_and_open_page
  end

  it "edit book with valid attribute", js: true do
    login_as(user)

    visit root_path
    expect(page).to have_content("Swastika")
    click_link "Edit"

    within('#book-modal', visible: true) do
      expect(page).to have_content("Edit Data")
      find(:css, "#book_name").set "Thika"
      click_button "Submit"
    end
    book.reload

    expect(page).to have_content("Thika")

    book.reload

    expect(book.name).to eq("Thika")

    save_and_open_page
 end

  it "destroy book with valid attribute", js: true do
    login_as(user)

      visit root_path
      expect(page).to have_content("Swastika")
      click_link "Destroy"

    save_and_open_page
  end

  it "create book with unvalid attribute", js: true do
    login_as(user)

    visit root_path
    click_link "Entry new data"

    within('#book-modal', visible: true) do
      expect(page).to have_content("New Entry Data")
      fill_in("book_name", :with => "")
      fill_in("book_number", :with => "")
      click_button "Submit"
    end

    expect(page).to have_content("error")

    save_and_open_page
  end

  it "edit book with unvalid attribute", js: true do
    login_as(user)

    visit root_path
    expect(page).to have_content("Swastika")
    click_link "Edit"

    within('#book-modal', visible: true) do
      expect(page).to have_content("Edit Data")
      find(:css, "#book_name").set "Thika1"
      find(:css, "#book_number").set "081-872665553"
      click_button "Submit"
    end
    book.reload

    expect(page).to have_content("error")

    save_and_open_page
 end
end
