require 'active_record'
require 'mysql2'
require 'switch_point'

ActiveRecord::Base.configurations = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(:development_master)
ActiveRecord::Base.establish_connection(:development_slave)

SwitchPoint.configure do |config|
  config.define_switch_point :mydb,
    readonly: :development_slave,
    writable: :development_master
end

class T < ActiveRecord::Base
  use_switch_point :mydb
end

T.with_writable do
  puts T.create(col1: 1, col2: 2)
  puts T.create(col1: 1, col2: 2)
end

T.with_readonly do
  puts T.find_by_id(1)
  puts T.find_by_id(2)
end
