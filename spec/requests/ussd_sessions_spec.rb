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
    {session_id: '101', phone_number: '102', service_code: '110', network_code: '11112'}
  }

  let(:valid_attributes_register) {
    {session_id: '101', phone_number: '102', service_code: '110', network_code: '11112', text: 'we*Frederick N*12345'}
  }

  let(:valid_attributes_name) {
    {session_id: '101', phone_number: '102', service_code: '110', network_code: '11112', text: 'we'}
  }

  let(:valid_attributes_id) {
    {session_id: '101', phone_number: '102', service_code: '110', network_code: '11112', text: 'we*Frederick N'}
  }

  let(:invalid_attributes) {
    { sessionIXd: '101'}
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
          post ussd_sessions_url, params:  valid_attributes 
        }.to change(UssdSession, :count).by(1)
      end

      it "returns the USSD message for the initial request" do
        post ussd_sessions_url, params:  valid_attributes 
        expect(response.body).to eq("CON Welcome to myKeekapu,  102\nReply with any character to register")
      end

      it "returns the USSD message for the regsitration complete" do
        post ussd_sessions_url, params:  valid_attributes_register
        expect(response.body).to eq("END You have successfully been registered on myKeekapu")
      end

      it "returns the USSD message for name request" do
        post ussd_sessions_url, params:  valid_attributes_name
        expect(response.body).to eq("CON What is your name?")
      end

      it "returns the USSD message for ID number request" do
        post ussd_sessions_url, params:  valid_attributes_id
        expect(response.body).to eq("CON Please enter your ID number")
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
        {session_id: '101', phone_number: '102', service_code: '110', network_code: '11112', text: 'we*Frederick N*1234'}
      }

      it "updates the requested ussd_session" do
        ussd_session = UssdSession.create! valid_attributes
        patch ussd_session_url(ussd_session), params: { ussd_session: new_attributes }
        ussd_session.reload
        expect(response).to_not be_successful
      end

      it "redirects to the ussd_session" do
        ussd_session = UssdSession.create! valid_attributes
        patch ussd_session_url(ussd_session), params: new_attributes 
        ussd_session.reload
        expect(response).to redirect_to(ussd_session_url(ussd_session))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        ussd_session = UssdSession.create! valid_attributes
        patch ussd_session_url(ussd_session), params: invalid_attributes 
        expect(response).to_not be_successful
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
