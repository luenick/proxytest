require 'net/ping'
require 'pry'

def connectable?(proxy)
  host, port = proxy.split(':')
  return Net::Ping::TCP.new(host, port).ping
end

File.open(ARGV[0], "r") do |f|
  f.each_line do |line|
    if connectable?(line.strip)
      puts line
    end
  end
end
