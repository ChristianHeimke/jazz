class Network < ActiveRecord::Base
  attr_accessible :broadcast, :gateway, :ip, :maske, :used
end
