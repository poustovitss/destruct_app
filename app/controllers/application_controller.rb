get '/' do
  erb :message
end

post '/messages' do
  @message = Message.new(params[:message])
  if @message.save
    redirect "/message/#{@message.id}", flash[:notice] = 'Congrats! You message was created!'
  else
    redirect '/', flash[:error] = @message.errors
  end
end

get '/message/:id' do
  @message = Message.find(params[:id])
  erb :message_view
end
