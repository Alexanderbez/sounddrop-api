require 'sinatra'
require './api/app'

set :environment, ENV.fetch('ENV')
set :run, false
set :raise_errors, true
set :server, 'thin'
set :show_exceptions, true

run Sinatra::Application
