require "net/http"
require "uri"
list = ["http://carnal0wnage.blogspot.com/", 
 "http://www.mcgrewsecurity.com/",
 "http://www.gnucitizen.org/blog/",
 "http://www.darknet.org.uk/",
 "http://spylogic.net/",
 "http://taosecurity.blogspot.com/",
 "http://www.room362.com/",
 "http://blog.sipvicious.org/",
 "http://blog.portswigger.net/",
 "http://pentestmonkey.net/blog/",
 "http://jeremiahgrossman.blogspot.com/",
 "http://i8jesus.com/",
 "http://blog.c22.cc/",
 "http://www.skullsecurity.org/blog/",
 "http://blog.metasploit.com/",
 "http://www.darkoperator.com/",
 "http://blog.skeptikal.org/",
 "http://preachsecurity.blogspot.com/",
 "http://www.tssci-security.com/",
 "http://www.gdssecurity.com/l/b/",
 "http://websec.wordpress.com/",
 "http://bernardodamele.blogspot.com/",
 "http://laramies.blogspot.com/",
 "http://www.spylogic.net/",
 "http://blog.andlabs.org/",
 "http://xs-sniper.com/blog/",
 "http://www.commonexploits.com/",
 "http://www.sensepost.com/blog/",
 "http://wepma.blogspot.com/",
 "http://exploit.co.il/",
 "http://securityreliks.wordpress.com/",
 "http://www.madirish.net/index.html",
 "http://sirdarckcat.blogspot.com/",
 "http://reusablesec.blogspot.com/",
 "http://myne-us.blogspot.com/",
 "http://www.notsosecure.com/",
 "http://blog.spiderlabs.com/",
 "http://www.corelan.be/",
 "http://www.digininja.org/",
 "http://www.pauldotcom.com/",
 "http://www.attackvector.org/",
 "http://deviating.net/",
 "http://www.alphaonelabs.com/",
 "http://www.smashingpasswords.com/",
 "http://wirewatcher.wordpress.com/",
 "http://gynvael.coldwind.pl/",
 "http://www.nullthreat.net/",
 "http://www.question-defense.com/",
 "http://archangelamael.blogspot.com/",
 "http://memset.wordpress.com/",
 "http://sickness.tor.hu/",
 "http://punter-infosec.com/",
 "http://www.securityninja.co.uk/",
 "http://securityandrisk.blogspot.com/",
 "http://esploit.blogspot.com/",
 "http://www.pentestit.com/"]


results = {}

def check_site(site,hash)
  uri = URI.parse(site)

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)

  hash["#{uri}"] = response.code
  
end

list.each do |site|
  begin
    check_site(site,results)
  rescue Exception => e
    p e
  end
end
puts results
