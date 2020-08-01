require "rails_helper"

RSpec.describe UssdSessionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ussd_sessions").to route_to("ussd_sessions#index")
    end

    it "routes to #new" do
      expect(get: "/ussd_sessions/new").to route_to("ussd_sessions#new")
    end

    it "routes to #show" do
      expect(get: "/ussd_sessions/1").to route_to("ussd_sessions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/ussd_sessions/1/edit").to route_to("ussd_sessions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/ussd_sessions").to route_to("ussd_sessions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/ussd_sessions/1").to route_to("ussd_sessions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/ussd_sessions/1").to route_to("ussd_sessions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/ussd_sessions/1").to route_to("ussd_sessions#destroy", id: "1")
    end
  end
end
