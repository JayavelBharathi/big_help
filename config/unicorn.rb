rails_root = File.expand_path('../..', __FILE__)
worker_processes 4 
working_directory rails_root

# This loads the application in the master process before forking
# worker processes
# Read more about it here:
# http://unicorn.bogomips.org/Unicorn/Configurator.html
preload_app false

timeout 30

if ENV['RACK_ENV'] == "test"
  pid "#{rails_root}/tmp/pids/unicorn_test.pid"
  listen File.expand_path('tmp/sockets/unicorn_test.sock', rails_root), :backlog => 64
else
  pid "#{rails_root}/tmp/pids/unicorn.pid"
  listen File.expand_path('tmp/sockets/unicorn.sock', rails_root), :backlog => 64
end

before_fork do |server, worker|
# This option works in together with preload_app true setting
# What it does is prevent the master process from holding
# the database connection
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
# Here we are establishing the connection after forking worker
# processes
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

