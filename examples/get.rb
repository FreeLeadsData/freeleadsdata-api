require 'freeleadsdata-api'

api_key = 'foo'
client = BlackStack::FreeLeadsData::API.new(api_key)

a = client.get('created by API')
p a['status']
p a['searches'].size
p a['searches'].first

