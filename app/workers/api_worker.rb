class ApiWorker
  include Sidekiq::Worker

  def perform(domain_id)
    domain = Domain.find(domain_id)
    hostname = domain[:hostname]

    # steps to grab origin_ip_address
    dns = Dnsruby::Resolver.new
    result = dns.query(hostname)
    request = result.answer.last.rdata_to_string
    domain.update_attribute(:origin_ip_address, request)

    # quick console test
    puts "JOB COMPLETE for #{domain[:hostname]}"
  end
end
