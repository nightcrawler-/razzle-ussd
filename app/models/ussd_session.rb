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
class UssdSession < ApplicationRecord

    ##################### Validations ######################################

    validates_presence_of   :session_id, :phone_number, :service_code, :network_code

    validates   :phone_number, telephone_number: {country: 'KE', types: [:fixed_line, :mobile]}

    ##################### Associations #####################################

    belongs_to  :customer, optional: true

    ##################### Callbacks #########################################

    # Find customer by phone number if existing and attach to session

    before_create   :attach_customer

    ##################### Behaviours/Other Properties #######################

    def response

        if text.present?
            data = self.text.split('*')

            case data.length()  
                when 1
                    return 'CON What is your name?'
                when 2
                    return 'CON Please enter your ID number'
                when 3
                    return 'END You have successfully been registered on myKeekapu'
            end
        else
            return 'CON Welcome to myKeekapu,  ' + self.phone_number + "\nReply with any character to register"   
        end

    end

    private
    def attach_customer
        self.customer = Customer.find_by_phone_number(self.phone_number)
    end
end
