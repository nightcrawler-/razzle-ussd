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
class Customer < ApplicationRecord

    ####################### Validations ##################################

    validates_presence_of   :name, :phone_number, :national_id

    validates_format_of :name, with: /^[a-zA-Z\s]*$/i, multiline: true

    validates :phone_number, telephone_number: {country: 'KE', types: [:fixed_line, :mobile]}

    validates_format_of :national_id, with: /^[0-9]{7,8}$/i, multiline: true

    validates_uniqueness_of :national_id

    ####################### Associations ##################################

    has_many    :ussd_sessions

end
