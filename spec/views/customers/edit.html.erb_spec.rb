require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      name: "Lizzy K",
      phone_number: "0723006561",
      national_id: "2345677"
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      assert_select "input[name=?]", "customer[name]"

      assert_select "input[name=?]", "customer[phone_number]"

      assert_select "input[name=?]", "customer[national_id]"
    end
  end
end
