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
  validates_length_of :origin_ip_address, is: 15, message: "your ip address length is incorrect."


  def get_origin_ip_address(hostname)
    # create get request for json object with hostname's id
    hostname_object = `curl http://api.distil-app-dev.com:3000/domains/#{hostname.id}`

    jsonified_hostname = JSON.parse(hostname_object)
    jsonified_hostname["origin_ip_address"]



  end



end
