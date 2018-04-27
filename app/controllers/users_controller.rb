class UsersController < InheritedResources::Base

  def import
    if User.import(params[:file])
      flash[:notice] = "Import successfully."
      redirect_to users_path, notice: "Users has been successfully imported."
    else
      flash[:error] = "Something went wrong. Please check the file format."
      render 'welcome/upload'
    end
  end

end
