require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        name: "Name",
        phone_number: "0723006561",
        national_id: "29425870"
      ),
      Customer.create!(
        name: "Name",
        phone_number: "0723006561",
        national_id: "29425871"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "0723006561".to_s, count: 2
    assert_select "tr>td", text: "29425871".to_s, count: 1
  end
end
