require 'logbert'

# Setup Logbert and SoundDrop
unless defined?(APP_ROOT)
  APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), "..")).freeze
end

dirname = File.dirname(File.join(APP_ROOT, "log", "sounddrop.log"))
unless File.directory?(dirname)
  FileUtils.mkdir_p(dirname)
end

Logbert.root.handlers << Logbert::Handlers::StreamHandler.new
Logbert.root.handlers << Logbert::Handlers::LogRotator.new(
  File.absolute_path(File.join(APP_ROOT, "log", "sounddrop.log")),
  max_backups: 7
)
Logbert.root.level = :info

LOG = Logbert[self]
CLIENT = SoundDrop::Client.new(
  client_id: ENV['SC_CLIENT_ID'],
  client_secret: ENV['SC_CLIENT_SECRET']
)
