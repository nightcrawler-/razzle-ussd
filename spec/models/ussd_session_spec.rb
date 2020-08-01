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
#  session_id   :string
#
require 'rails_helper'

RSpec.describe UssdSession, type: :model do

  subject {
    described_class.new(
      session_id: 'miaw',
      phone_number: '1234',
      service_code: 'aha',
      network_code: 'woooho'
    )
  }

  describe "Validations" do

    it "should be valid with valid attributes" do
      expect(subject).to be_valid
    end

  end

end
