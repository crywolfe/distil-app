# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

accounts = Account.create([{name: 'test_account_1'}, {name: 'test_account_2'}, {name: 'test_account_1'}])

domains = Domain.create([
  {hostname: 'www.distilnetworks.com', origin_ip_address: '123.456.789.123', account_id: 1},
  {hostname: 'www.funfunfun.com', origin_ip_address: '987.654.321.987', account_id: 1}
  {hostname: 'www.happytimes.com', origin_ip_address: '111.222.333.444', account_id: 2}

  ])
