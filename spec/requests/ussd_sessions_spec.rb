 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/ussd_sessions", type: :request do
  # UssdSession. As you add validations to UssdSession, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      UssdSession.create! valid_attributes
      get ussd_sessions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      ussd_session = UssdSession.create! valid_attributes
      get ussd_session_url(ussd_session)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_ussd_session_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      ussd_session = UssdSession.create! valid_attributes
      get edit_ussd_session_url(ussd_session)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new UssdSession" do
        expect {
          post ussd_sessions_url, params: { ussd_session: valid_attributes }
        }.to change(UssdSession, :count).by(1)
      end

      it "redirects to the created ussd_session" do
        post ussd_sessions_url, params: { ussd_session: valid_attributes }
        expect(response).to redirect_to(ussd_session_url(UssdSession.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new UssdSession" do
        expect {
          post ussd_sessions_url, params: { ussd_session: invalid_attributes }
        }.to change(UssdSession, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post ussd_sessions_url, params: { ussd_session: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested ussd_session" do
        ussd_session = UssdSession.create! valid_attributes
        patch ussd_session_url(ussd_session), params: { ussd_session: new_attributes }
        ussd_session.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the ussd_session" do
        ussd_session = UssdSession.create! valid_attributes
        patch ussd_session_url(ussd_session), params: { ussd_session: new_attributes }
        ussd_session.reload
        expect(response).to redirect_to(ussd_session_url(ussd_session))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        ussd_session = UssdSession.create! valid_attributes
        patch ussd_session_url(ussd_session), params: { ussd_session: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested ussd_session" do
      ussd_session = UssdSession.create! valid_attributes
      expect {
        delete ussd_session_url(ussd_session)
      }.to change(UssdSession, :count).by(-1)
    end

    it "redirects to the ussd_sessions list" do
      ussd_session = UssdSession.create! valid_attributes
      delete ussd_session_url(ussd_session)
      expect(response).to redirect_to(ussd_sessions_url)
    end
  end
end