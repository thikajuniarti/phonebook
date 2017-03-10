require "rails_helper"

RSpec.describe User, :type => :model do
  it { should have_many(:books) }

  it "is not valid without a password" do
    expect(build(:user, email: nil)).to_not be_valid
  end

  it "is not valid without an email" do
    expect(build(:user, password: nil)).to_not be_valid
  end
end
