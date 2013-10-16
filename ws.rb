require 'sinatra/base'

require 'conjur/demo/sinatra'

class ServiceAccessControl < Sinatra::Base
  extend Conjur::Demo::Sinatra
  
  configure!
  
  helpers do
    def can?(privilege, resource)
      resource = @api.resource [ account, 'service', [ namespace, resource ].join('/') ].join(':')
      resource.permitted?(privilege)
    end
  end
  
  get '/fry/bacon' do
    halt(403) unless can?('fry', 'bacon')
    
    'Bacon fried!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
