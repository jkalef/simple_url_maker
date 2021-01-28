require 'rails_helper'

RSpec.describe UserUrlsController, type: :controller do
  describe "#create" do

    context "with a valid long url" do
      let(:valid_request) do
        post :create, { params: { user_url: { long_url: "http://google.com" }}}    
      end

      it "creates a new url record" do
        expect{ valid_request }.to change{ UserUrl.count }.by(1)
      end

      it "saves the long url" do
        valid_request
        url = UserUrl.last
        expect(url.long_url).to be
      end

      it "creates a new short url" do
        valid_request
        url = UserUrl.last
        expect(url.short_url).to be
      end

      it "redirects to the index view" do
        expect(valid_request).to redirect_to(user_urls_path)
      end

      it "sets a flash notice" do
        valid_request
        expect(flash[:notice]).to be
      end
    end

    context "with an invalid long url" do
      let(:invalid_request) {
        post :create, params: { user_url: { long_url: "not_valid" }}
      }

      it "does not create a new url" do
        expect{ invalid_request }.to_not change{ UserUrl.count }
      end

      it "redirects back to the new screen" do
        expect(invalid_request).to render_template(:new)
      end
    end
  end 

  describe "#show" do
    before { @url = UserUrl.create(long_url: "https://chitchats.com", short_url: "https://chitcha.ts/AsgWQ") }

    let(:valid_request) {
      get :show, params: { id: @url.id }
    }

    it "creates a url_statistic record" do
      expect{ valid_request }.to change{ @url.url_statistics.count }.by(1)
    end

    it "logs the IP of the visitor in the url_statistic" do
      valid_request
      statistic = @url.url_statistics.last
      expect(statistic.visit_ip_address).to be
    end

    it "redirects to the long url" do
      expect(valid_request).to redirect_to(@url.long_url)
    end
  end


end