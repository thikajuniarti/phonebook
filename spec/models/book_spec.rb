require "rails_helper"

RSpec.describe Book, :type => :model do
  it { should belong_to(:user) }

  it "has none to begin with" do
    expect(Book.count).to eq 0
  end

  it "has one after adding one" do
    book = create(:book)
    expect(Book.count).to eq(1)
  end

  it "is not valid without a name and number" do
    expect(build(:book, name: nil, number: nil)).to_not be_valid
  end

  it "is not valid if data is empty" do
    expect(build(:book, name: nil, address: nil, number: nil, email: nil)).to_not be_valid
  end

  it "is not valid if a name consist of number and a number consist of letter" do
    expect(build(:book, name: '12345', number: 'sby')).to_not be_valid
  end

  it "must consist minimum 5 characters" do
    expect(build(:book, name: 'ab')).to_not be_valid
  end
end
