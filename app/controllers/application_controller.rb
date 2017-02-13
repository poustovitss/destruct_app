get '/' do
  erb :message
end

post '/messages' do
  @message = Message.new(params[:message])
  if @message.save
    redirect "/message/#{@message.id}", flash[:notice] = 'Message was created!'
  else
    redirect '/', flash[:error] = @message.errors
  end
end

get '/message/:id' do
  @message = Message.find(params[:id])
  @message.add_view
  erb :message_view
end
