require 'spec_helper'

describe Url do
  it { should validate_presence_of(:link) }

  it "generates a new random key when created" do
    allow(SecureRandom).to receive(:urlsafe_base64).and_return "12H34B5"
    url = FactoryGirl.create(:url)
    expect(url.key).to eq "12H34B5"
  end
end
