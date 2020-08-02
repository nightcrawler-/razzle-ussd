require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      name: "Name",
      phone_number: "0723006561",
      national_id: "29425870"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/0723006561/)
    expect(rendered).to match(/29425870/)
  end
end
