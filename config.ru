require 'sinatra'
require 'erb'
require './api/app'

set :environment, ENV.fetch('ENV', 'development')
set :run, false
set :server, 'thin'
disable :show_exceptions
disable :raise_errors

run Sinatra::Application
