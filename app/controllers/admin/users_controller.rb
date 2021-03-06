class Admin::UsersController < Admin::BaseController
  before_action :require_super_admin!

   def index
     @users = User.all.paginate(:page => params[:page], :per_page => 20)
   end

   def edit
     @user = User.find(params[:id])
   end

   def update
     @user = User.find(params[:id])

     if @user.update(user_params)
       redirect_to admin_users_path
     else
       render "edit"
     end
   end

   protected

   def user_params
     params.require(:user).permit(:time_zone, :username,:email,:username, :role, :summary)
   end
end
