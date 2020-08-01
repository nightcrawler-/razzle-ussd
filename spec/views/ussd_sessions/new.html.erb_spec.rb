require 'rails_helper'

RSpec.describe "ussd_sessions/new", type: :view do
  before(:each) do
    assign(:ussd_session, UssdSession.new(
      session_id: "MyString",
      phone_number: "MyString",
      network_code: "MyString",
      service_code: "MyString",
      text: "MyText"
    ))
  end

  it "renders new ussd_session form" do
    render

    assert_select "form[action=?][method=?]", ussd_sessions_path, "post" do

      assert_select "input[name=?]", "ussd_session[session_id]"

      assert_select "input[name=?]", "ussd_session[phone_number]"

      assert_select "input[name=?]", "ussd_session[network_code]"

      assert_select "input[name=?]", "ussd_session[service_code]"

      assert_select "textarea[name=?]", "ussd_session[text]"
    end
  end
end
