require 'io/console'
require 'bundler'
require 'faker'
Bundler.require

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3', 
    database: 'db/development.db')

ActiveRecord::Base.logger = nil
require_all 'lib'
