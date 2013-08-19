get '/' do
  erb :index
end


get '/:username' do
  @user = TwitterUser.find_by_screen_name(params[:username])
  @tweets = @user.tweets
  erb :user
end
