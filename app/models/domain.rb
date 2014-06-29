# == Schema Information
#
# Table name: domains
#
#  id                :integer          not null, primary key
#  hostname          :string(255)
#  origin_ip_address :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  account_id        :integer
#

class Domain < ActiveRecord::Base
  belongs_to :account
  validates :hostname, presence: true, uniqueness: true
  validates :origin_ip_address, presence: true

  # def ip_address_finder(hostname)
  #   dns = Dnsruby::Resolver.new
  #   result = dns.query(hostname)
  #   ip_origin_address = result.answer.last.rdata_to_string
  # end


end
