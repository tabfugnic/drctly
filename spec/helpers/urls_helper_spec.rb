require 'spec_helper'

describe UrlsHelper do
  describe "#generated_link" do
    it "spouts out a generated url" do
      expect(helper.generated_link("blongbling")).to eq "http://test.host/blongbling"
    end
  end
end
