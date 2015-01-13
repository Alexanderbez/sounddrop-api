require 'json'
require 'sounddrop'

# Setup
load 'config/config.rb'

# Handle raised errors
error do
  halt(
    500,
    {
      'error' => 'Sorry there was a nasty error - ' + env['sinatra.error'].to_s
    }.to_json
  )
end

# GET home/default route
get '/' do
  erb("", :layout => :index)
end

# POST (non-API) route handle getting Soundcloud track information via the UI
post '/song' do
  song_url = params['songUrl']

  LOG.info "Attempting to get Drop for #{song_url}"
  drop = CLIENT.get_drop(song_url)

  @dl_url = drop.media_url
  @title = drop.title
  @file_name = drop.title + '.mp3'

  erb(:url, :layout => :index)
end

# POST route to handle getting Soundcloud track information
post '/api/drop' do
  headers "Content-Type" => "application/json; charset=utf-8"
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
