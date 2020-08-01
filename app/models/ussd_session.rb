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

    validates_presence_of   :session_id, :phone_number, :service_code, :text

    ##################### Associations #####################################

    
end
