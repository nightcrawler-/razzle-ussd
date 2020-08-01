require 'rails_helper'

RSpec.describe "ussd_sessions/show", type: :view do
  before(:each) do
    @ussd_session = assign(:ussd_session, UssdSession.create!(
      session_id: "Session",
      phone_number: "Phone Number",
      network_code: "Network Code",
      service_code: "Service Code",
      text: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Session/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Network Code/)
    expect(rendered).to match(/Service Code/)
    expect(rendered).to match(/MyText/)
  end
end
