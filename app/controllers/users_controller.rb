class UsersController < Clearance::UsersController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :only_edit_self, :only => [:edit, :update]

  def new
    flash[:error] = "What? Why do you try to sign up?"
    redirect_to root_path
  end

  def create
    flash[:error] = "What? Why?"
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_password params[:user][:password], params[:user][:password_confirmation]
      flash[:notice] = 'Your password was updated successfully'
      redirect_to root_url
    else
      flash[:error] = 'Bad things happen sometimes. Sorry, try again.'
      render :edit
    end
  end

  private
    def only_edit_self
      unless current_user == User.find(params[:id])
        flash[:error] = 'What are you doing here, exactly?'
        redirect_to root_url
      end
    end
end
