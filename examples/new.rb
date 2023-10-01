require 'freeleadsdata-api'

api_key = 'foo'
client = BlackStack::FreeLeadsData::API.new(api_key)

p client.new({
    'name' => 'test (created by API)',
    'stop_limit' => 999999, # 400 million
    'status' => true,
    'verify_email' => false, 
    'direct_phone_number_only' => false,
    'job_titles' => [
        # job positions to include
        { 'value' => 'Owner', 'positive' => true },
        { 'value' => 'CEO', 'positive' => true },
        { 'value' => 'Founder', 'positive' => true },
        { 'value' => 'President', 'positive' => true },
        { 'value' => 'Director', 'positive' => true },
    ],
    'states' => [
        # locations to include
        { 'value' => 'FL', 'positive' => true }, 
    ],
    'company_headcounts' => [
        # headcounts to include
        { 'value' => '1 to 10', 'positive' => true },
        { 'value' => '11 to 25', 'positive' => true },
        { 'value' => '26 to 50', 'positive' => true },
    ],
})

