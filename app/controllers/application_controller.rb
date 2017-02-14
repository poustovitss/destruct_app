get '/' do
  erb :message
end

post '/messages' do
  message = params[:message]
  message[:ttl] = message[:ttl].to_i * 3600

  @message = Message.new(message)
  if @message.save
    redirect "/message/#{@message.unique_hash}",
             flash[:notice] = 'Message was created!'
  else
    redirect '/', flash[:error] = @message.errors
  end
end

get '/message/:unique_hash' do
  @message = Message.where(unique_hash: params[:unique_hash]).first
  if @message.is_expired?
    erb :message_expired
  else
    @message.increase_view
    erb :message_view
  end
end
