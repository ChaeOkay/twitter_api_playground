get '/' do
  erb :index
end


get '/:username' do
  @user = User.find_by_screen_name(params[:username])
  @tweets = @user.tweets
  erb :user
end
