json.extract! ussd_session, :id, :session_id, :phone_number, :network_code, :service_code, :text, :created_at, :updated_at
json.url ussd_session_url(ussd_session, format: :json)
