require 'json'
require 'sounddrop'

# Setup
load 'config/config.rb'

# Set utf-8 for outgoing responses
before do
  headers "Content-Type" => "application/json; charset=utf-8"
end

# Handle invalid route
not_found do
  'Invalid route!'
end

# Handle raised errors
error do
  halt(
    500,
    {
      'error' => 'Sorry there was a nasty error - ' + env['sinatra.error'].to_s
    }.to_json
  )
end

get '/' do

end

# POST route to handle getting Soundcloud track information
post '/api/drop' do
  request.body.rewind
  payload = JSON.parse(request.body.read)

  LOG.info "Attempting to get Drop for #{payload['url']}"
  drop = CLIENT.get_drop(payload['url'])
  result = {
    title: drop.title,
    genre: drop.genre,
    media_url: drop.media_url
  }

  result.to_json
end
