require 'spec_helper'
describe UrlsController do

  describe "GET show" do
    it "assigns the requested url as @url" do
      url = FactoryGirl.create(:url)
      get :show, id: url.to_param
      assigns(:url).should eq(url)
    end
  end

  describe "GET new" do
    it "assigns a new url as @url" do
      get :new
      assigns(:url).should be_a_new(Url)
    end
  end


  describe "POST create" do
    let(:attributes) { FactoryGirl.attributes_for(:url) }

    describe "with valid params" do
      it "creates a new Url" do
        expect { post :create, url: attributes }
          .to change { Url.count }.by(1)
      end

      it "assigns a newly created url as @url" do
        post :create, url: attributes
        assigns(:url).should be_a(Url)
        assigns(:url).should be_persisted
      end

      it "redirects to the created url" do
        post :create, url: attributes
        response.should redirect_to(Url.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved url as @url" do
        Url.any_instance.stub(:save).and_return(false)
        post :create, url: { link: "invalid value" }
        assigns(:url).should be_a_new(Url)
      end

      it "re-renders the 'new' template" do
        Url.any_instance.stub(:save).and_return(false)
        post :create, url: { link: "invalid value" }
        response.should render_template("new")
      end
    end
  end

  describe "GET direct" do
    let(:url) { FactoryGirl.create(:url) }
    it "finds and assigns the url by code" do
      get :direct, code: url.key
      expect(assigns(:url)).to eq url
    end
    it "directs the user to the assigned url" do
      get :direct, code: url.key
      expect(response).to redirect_to url.link
    end
  end
end
