#require 'rubygems'
#require 'mysqlplus'
require 'date'

##my = Mysql.new(hostname, username, password, databasename)
#con = Mysql.new('192.168.227.1', 'lksodin', 'test5408', 'test')
#rs = con.query('select * from test')
#
##rs = con.create_db('rubytest')
#rs.each_hash { |h|
#	puts h['dat']
#}
#con.close

  put '/blog/:urlname/post/:post_id' do
    content_type :json
    begin
      blog = Blog.first( conditions: { urlname: params[:urlname]})
      post = Post.find( params[:id] )

      ReturnStatus.json_response( 
        status ,
        {"blog" => blog ,"posts" => post ,"total_posts" => 1}
       )
    rescue => ex
      status 500
      raise ex
    end
  end

#time = Time.new
#time += (24 * 60 * 60)
#p Time.now.strftime("%Y-%m-%d %H:%M:%S").to_s > time.strftime("%Y-%m-%d %H:%M:%S").to_s
#p time.strftime("%Y-%m-%d %H:%M:%S")
#
#p Time.mktime('2011-09-08 06:38:53 UTC')
#p time.utc
#p '2011-09-08 06:38:53 UTC' > '2011-09-08 06:38:53'

#Dir.foreach("./") do |entry|
#  if entry =~ /^[\.]{1,2}$/
#    puts entry
#  end
#end

x = /^[a-z]{1}$/i
puts 'b' =~ x
