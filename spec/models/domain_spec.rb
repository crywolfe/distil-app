require 'spec_helper'

describe Domain do
  let(:domain) { Domain.new}

  #test validations
  it { should validate_presence_of(:hostname) }
  it { should validate_uniqueness_of(:hostname) }
  it { should validate_presence_of(:origin_ip_address) }
  it { should belong_to(:account) }

  #test domain method
  describe '#ip_address_finder' do
    it 'finds the ip address of the hostname' do
      hostname = 'www.geraldwolfe.com'
      results = domain.ip_address_finder(hostname)
      expect(results).to eq("23.235.46.133")
    end
  end




end
