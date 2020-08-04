# == Schema Information
#
# Table name: customers
#
#  id           :bigint           not null, primary key
#  name         :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  national_id  :string
#
require 'rails_helper'

RSpec.describe Customer, type: :model do

  subject {
    described_class.new(
      name: 'Lizzy Caplan',
      phone_number: '0723006561',
      national_id: '12345678'
    )
  }

  describe "Validations" do 
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'should not be valid with invalid name' do
      subject.name = 'Flavia 123'
      expect(subject).to_not be_valid
    end

    it 'should not be valid with invalid national id' do
      subject.national_id = '123'
      expect(subject).to_not be_valid
    end

    it 'shoud not be valid with invalid phone number' do
      subject.phone_number = '1234'
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should have_many(:ussd_sessions) }
  end

end
