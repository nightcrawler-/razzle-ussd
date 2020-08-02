# == Schema Information
#
# Table name: ussd_sessions
#
#  id           :bigint           not null, primary key
#  network_code :string
#  phone_number :string
#  service_code :string
#  text         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  customer_id  :bigint
#  session_id   :string
#
require 'rails_helper'

RSpec.describe UssdSession, type: :model do

  let(:customer) {Customer.create(phone_number: "0723006561", name: "Frederick N", national_id: "29425875")}

  subject {
    described_class.new(
      session_id: 'miaw',
      phone_number: '0723006561',
      service_code: 'aha',
      network_code: 'woooho'
    )
  }

  describe "Validations" do

    it "should be valid with valid attributes" do
      expect(subject).to be_valid
    end

  end

  describe "Associations" do
    it { should belong_to(:customer).without_validating_presence }
  end

  describe "Behaviours" do
    it "should return a response for available customers welcome" do
      subject.customer = customer
      expect(subject.response).to eq("CON Hello Frederick N, welcome back to myKeekapu. \n2.Place order\n3.My Orders")
    end
  end
end
