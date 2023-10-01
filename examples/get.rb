require_relative '../lib/freeleadsdata-api'

api_key = 'foo'
client = BlackStack::FreeLeadsData::API.new(api_key, 'http://127.0.0.1:3000')

a = client.get('created by API')
p a['status']
p a['searches'].size
p a['searches'].first

