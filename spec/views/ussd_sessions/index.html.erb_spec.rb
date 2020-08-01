require 'rails_helper'

RSpec.describe "ussd_sessions/index", type: :view do
  before(:each) do
    assign(:ussd_sessions, [
      UssdSession.create!(
        session_id: "Session",
        phone_number: "Phone Number",
        network_code: "Network Code",
        service_code: "Service Code",
        text: "MyText"
      ),
      UssdSession.create!(
        session_id: "Session",
        phone_number: "Phone Number",
        network_code: "Network Code",
        service_code: "Service Code",
        text: "MyText"
      )
    ])
  end

  it "renders a list of ussd_sessions" do
    render
    assert_select "tr>td", text: "Session".to_s, count: 2
    assert_select "tr>td", text: "Phone Number".to_s, count: 2
    assert_select "tr>td", text: "Network Code".to_s, count: 2
    assert_select "tr>td", text: "Service Code".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
