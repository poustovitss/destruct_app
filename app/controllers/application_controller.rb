get '/' do
  erb :message
end

post '/messages' do
  message = params[:message]
  message[:ttl] = message[:ttl].to_i * 3600

  @message = Message.new(message)
  if @message.save
    redirect "/message/#{@message.id}", flash[:notice] = 'Message was created!'
  else
    redirect '/', flash[:error] = @message.errors
  end
end

get '/message/:id' do
  @message = Message.find(params[:id])
  if @message.is_expired?
    erb :message_expired #'set nil to content field but not delete'
  elsif
    @message.increase_view
    erb :message_view
  end
end
