class Virtualmachine < ActiveRecord::Base
  attr_accessible :cpu, :description, :hdd, :hostname, :ip, :memory, :name, :os

  validates :name,  :presence => true
  validates :hostname, :presence => true
  validates :ip, :presence => true
  validates :memory, :presence => true
  validates :cpu, :presence => true
  validates :hdd, :presence => true

end
