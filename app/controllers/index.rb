get '/' do
  erb :index
end


get '/:username' do
  @user = User.find_or_create_by_screen_name(params[:username])
  erb :user
end
