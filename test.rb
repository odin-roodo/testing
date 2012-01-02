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

  post '/blog/:urlname/post' do
    content_type :json
    begin
      blog = Blog.first( conditions: { urlname: params[:urlname]})

      raise "Blog #{params[:urlname]} not exist" if blog.nil?

      data = {}
      #just for test
      if !params[:post_id].nil?
        data[:post_id] = params[:post_id]
        new_post_id = params[:post_id]
      end

      # ex: post = blog.text_posts.create! data
      post = "testing -dr"

      if data[:post_id].nil?
        #new_post_id = post._id.to_s.to_i(16).to_s.slice(0, 10)
        new_post_id = post.get_unique_post_id(params[:urlname],post._id.to_s)
        post.update_attributes(:post_id => new_post_id)
      end

      status 201  
      ReturnStatus.json_response(status,{ post_id: new_post_id })
    rescue => ex
      status 500
      raise ex
    end
  end

  put '/blog/:urlname/post/:post_id' do
    content_type :json
    begin
      blog = Blog.first( conditions: { urlname: params[:urlname]})
      raise "Blog #{params[:urlname]} not exist" if blog.nil?

      #criteria
      type = params[:type]
      conditions = { post_id: params[:post_id], urlname: params[:urlname] } 
      classname = "#{type.capitalize}Post"
      post = Kernel.const_get(classname).where(conditions).first

      raise "Post id #{params[:post_id]} of Blog #{params[:urlname]} not exist" if post.nil?

      # post type should not be changed when edit
      data = Post.data_mapping(params)
      fields_set = [:urlname,:state,:post_time,:format,:tags,:source_url,:source_title,:slug]

      fields_set.each do | field | 
        data[field] = params[field] unless params[field].nil?
      end

      post.update_attributes!(data)

      #if data[:post_id].nil?
      #  #new_post_id = post._id.to_s.to_i(16).to_s.slice(0, 10)
      #  new_post_id = post.get_unique_post_id(params[:urlname],post._id.to_s)
      #  post.update_attributes(:post_id => new_post_id)
      #end

      ReturnStatus.json_response( status )
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
