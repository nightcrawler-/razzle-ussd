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
class UssdSession < ApplicationRecord

    ##################### Validations ######################################

    validates_presence_of   :session_id, :phone_number, :service_code, :network_code

    ##################### Associations #####################################

    def response

        if !text.blank?
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
end
