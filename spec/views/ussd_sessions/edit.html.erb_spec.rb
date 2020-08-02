require 'rails_helper'

RSpec.describe "ussd_sessions/edit", type: :view do
  before(:each) do
    @ussd_session = assign(:ussd_session, UssdSession.create!(
      session_id: "MyString",
      phone_number: "0723006561",
      network_code: "MyString",
      service_code: "MyString",
      text: "MyText"
    ))
  end

  it "renders the edit ussd_session form" do
    render

    assert_select "form[action=?][method=?]", ussd_session_path(@ussd_session), "post" do

      assert_select "input[name=?]", "ussd_session[session_id]"

      assert_select "input[name=?]", "ussd_session[phone_number]"

      assert_select "input[name=?]", "ussd_session[network_code]"

      assert_select "input[name=?]", "ussd_session[service_code]"

      assert_select "textarea[name=?]", "ussd_session[text]"
    end
  end
end
