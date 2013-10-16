require 'sinatra/base'

$config = YAML.load(File.read('config.yml'))

ENV['CONJUR_ENV'] = $config[:env]
ENV['CONJUR_STACK'] = $config[:stack]
ENV['CONJUR_ACCOUNT'] = $config[:account]

class ServiceAccessControl < Sinatra::Base
  helpers do
    def account; $config[:account]; end
    def ns;  $config[:namespace];  end
  
    def request_headers
      env.inject({}){|acc, (k,v)| acc[$1.downcase] = v if k =~ /^http_(.*)/i; acc}
    end
  
    def can?(privilege, resource)
      resource = @api.resource [ account, 'service', [ ns, resource ].join('/') ].join(':')
      resource.permitted?(privilege)
    end
  
    def parse_authorization
      token = request_headers['authorization']
      halt(401) unless token
      halt(403) unless token.to_s[/^Token token="(.*)"/]
      token = JSON.parse(Base64.decode64($1))
      @api = Conjur::API::new_from_token token
    end
  end

  before do
    parse_authorization
  end
  
  get '/fry/bacon' do
    halt(403) unless can?('fry', 'bacon')
    
    'Bacon fried!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
