require 'blackstack-core'
module BlackStack
    module FreeLeadsData
        class API
            attr_accessor :api_key
            attr_accessor :api_url # default: https://freeleadsdata.com

            def initialize(api_key, api_url='https://freeleadsdata.com')
                @api_key = api_key
                @api_url = api_url
            end # def initialize

            def new(h)
                url = @api_url+'/api1.0/zi/new.json'
                begin
                    params = {
                        'api_key' => @api_key,
                        'search' => h,
                    }
                    res = BlackStack::Netting::call_post(url, params)
                    parsed = JSON.parse(res.body)
                    return parsed
                rescue Errno::ECONNREFUSED => e
                    raise 'Errno::ECONNREFUSED:' + e.message
                rescue => e2
                    raise 'Error:' + e2.message
                end        
            end # def new

            def get(filter = '', page = 1, page_size = 25)
                url = @api_url+'/api1.0/zi/get.json'
                begin
                    params = {
                        'api_key' => @api_key,
                        'filter' => filter,
                        'page' => page,
                        'page_size' => page_size,
                    }
                    res = BlackStack::Netting::call_post(url, params)
                    parsed = JSON.parse(res.body)
                    return parsed
                rescue Errno::ECONNREFUSED => e
                    raise 'Errno::ECONNREFUSED:' + e.message
                rescue => e2
                    raise 'Error:' + e2.message
                end        
            end # def get
        end # API
    end # FreeLeadsData
end # BlackStack
