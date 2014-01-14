require "spec_helper"

# describe HomeController do
#   describe "routing" do
#     it "routes to #index" do
#       expect(get("/")).to route_to("home#index")
#     end
#   end
# end

describe UrlsController do
  describe "routing" do

    it "routes to #new" do
      get("/urls/new").should route_to("urls#new")
    end

    it "routes to #show" do
      get("/urls/1").should route_to("urls#show", :id => "1")
    end

    it "routes to #create" do
      post("/urls").should route_to("urls#create")
    end
  end
end
