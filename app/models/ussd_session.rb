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

    before_save   :attach_customer

    ##################### Behaviours/Other Properties #######################

    def response
        # Make this a state machine? Handle sessions gracefully. for orders, only have specific routes, registration only for variables
        if text.present? #if text is not present, it is the first ussd request
            data = self.text.split('*')

            case data.length()  
                when 1
                    "CON What is your name?"
                when 2
                    "CON Please enter your ID number"
                when 3 
                    # create customer
                    # return model errors if any, well this should be done elsewhere, review gitlab code or other rails apps for hints
                    @customer = Customer.new(name: data[1], national_id: data[2], phone_number: self.phone_number)
                    if @customer.save
                         "END " +  @customer.name + ", you have successfully been registered on County Government of Kakamega"
                    else
                         "END Sorry, unable to complete registration. \n" + @customer.errors.full_messages.join(",\n") + "\n\nPlease try again after resolving the errors"
                    end
            end
        else
            if self.customer.blank?
                 "CON Welcome to County Government of Kakamega,  " + self.phone_number + "\n1. Register"  
            else
                 "CON Hello " + self.customer.name + ", welcome back to County Government of Kakamega. \n2. Make payment\n3. Payment history"
            end
        end

    end

    private
    def attach_customer
        self.customer = Customer.find_by_phone_number(self.phone_number)
    end
end
