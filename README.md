![Gem version](https://img.shields.io/gem/v/freeleadsdata-api) ![Gem downloads](https://img.shields.io/gem/dt/freeleadsdata-api)

# freeleadsdata-api

Ruby Gem for Managing [FreeLeadData.com](https://freeleadsdata.com) via API

## 1. Installation

```bash
gem install freeleadsdata-api
```

## 2. Setting Up a Client

```ruby
require 'freeleadsdata-api'
api_key = 'foo'
client = BlackStack::FreeLeadsData::API.new(api_key)
```

If you are a part of the develomment team of **FreeLeadsData**, you may want to connect your client to a FreeLeadsData running in your local environment:

```ruby
client = BlackStack::FreeLeadsData::API.new(api_key, 'http://127.0.0.1:3000')
```

## 3. Creating a New Search

```ruby
client.new({
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
```

## 4. Getting Searches

```ruby
a = client.get('created by API')
p a['status']
# => "success"
p a['searches'].size
# => 3
p a['searches'].first
# => {"id"=>"1c640f65-29c0-46e6-975d-bd57092d4cf4", "name"=>"test10 (created by API)", "status"=>true, "earning_per_verified_email"=>0.02200374531835206, "stop_limit"=>999999, "verify_email"=>false, "direct_phone_number_only"=>false, "auto_drain"=>true, "keywords"=>[], "job_titles"=>[{"positive"=>true, "value"=>"President"}, {"positive"=>true, "value"=>"Owner"}, {"positive"=>true, "value"=>"Director"}, {"positive"=>true, "value"=>"CEO"}, {"positive"=>true, "value"=>"Founder"}], "seniorities"=>[], "departments"=>[], "states"=>[{"positive"=>true, "value"=>"FL"}], "industries"=>[{"positive"=>true, "value"=>"Real Estate"}], "sics"=>[], "company_revenues"=>[], "company_headcounts"=>[{"positive"=>true, "value"=>"1 to 10"}, {"positive"=>true, "value"=>"26 to 50"}, {"positive"=>true, "value"=>"11 to 25"}], "company_names"=>[], "company_domains"=>[], "insight"=>{"enabled"=>false, "source"=>nil, "requirement"=>nil, "template"=>nil, "prompt1"=>nil, "prompt2"=>nil, "positive_response_pattern"=>nil, "negative_response_pattern"=>nil}, "export"=>{"export_download_url"=>"", "export_time"=>nil}, "stats"=>{"stat_tier1_scope"=>0, "stat_tier2_scope"=>0, "stat_tier3_scope"=>0, "stat_tier4_scope"=>0, "stat_tier5_scope"=>0, "stat_processed_results"=>0, "stat_verified_results"=>0, "stat_progress"=>0.0}, "economics"=>{"stat_earning"=>0.0, "stat_cost"=>0.0, "stat_profit"=>0.0}, "report"=>{"forecast_text"=>"0", "badge_color"=>"orange", "badge_text"=>"out of credits", "profit_color"=>"green", "profit_text"=>"+$ 0.0", "revenue_text"=>"0.0%", "scope"=>"~0", "progress"=>"0.0%", "processed"=>"0", "processed_rate"=>"0.0%", "verified"=>"0", "verified_rate"=>"0.0%"}}
```

## 5. Pagination

```ruby
page = 1
page_size = 10
a = client.get('created by API', page, page_size)
```