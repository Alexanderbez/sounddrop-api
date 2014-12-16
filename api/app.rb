require 'logbert'
require 'json'
require 'sounddrop'

LOG = Logbert[self]

# Set utf-8 for outgoing responses
before do
  headers "Content-Type" => "application/json; charset=utf-8"
end

get '/' do
  {:key1 => 'value1', :key2 => 'value2'}.to_json
end
