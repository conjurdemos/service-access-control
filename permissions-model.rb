require 'conjur/env'
config = {}
config[:env] = Conjur.env
config[:stack] = Conjur.stack
config[:account] = Conjur.account
config[:api_keys]  = {}

namespace do
  config[:namespace] = namespace
  
  bacon = resource "service", "bacon"
  user "#{namespace}-alice" do |alice|
    config[:api_keys][:alice] = alice.attributes['api_key']
  end
  user "#{namespace}-bob" do |bob|
    config[:api_keys][:bob] = bob.attributes['api_key']

    can "fry", bacon
  end
end

File.write('config.yml', config.to_yaml)

config.to_yaml