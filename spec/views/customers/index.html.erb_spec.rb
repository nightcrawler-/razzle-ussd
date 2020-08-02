require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        name: "Name",
        phone_number: "Phone Number",
        national_id: "National"
      ),
      Customer.create!(
        name: "Name",
        phone_number: "Phone Number",
        national_id: "National"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Phone Number".to_s, count: 2
    assert_select "tr>td", text: "National".to_s, count: 2
  end
end
