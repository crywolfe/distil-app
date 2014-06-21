# == Schema Information
#
# Table name: domains
#
#  id                :integer          not null, primary key
#  hostname          :string(255)
#  origin_ip_address :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Domain < ActiveRecord::Base
  belongs_to :account
  validates :hostname, presence: true, uniqueness: true
  validates :origin_ip_address, presence: true


end
