class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def index
        @profile=current_user.profile
    end
    def new
        @profile=Profile.new
    end
    def show
        @profile = current_user
        redirect_to @profile
    end
    def create
       @profile= current_user.build_profile(profile_params)
       if @profile.save
           redirect_to profiles_path, notice: 'profile was successfully created.'
       else
           render :new
       end
    end
    def edit
        @profile = current_user.profile
    end
    def update
        @profile = current_user.profile
            if @profile.update(profile_params)
              redirect_to profiles_path
            else
            redirect_to :edit, notice: 'Profile updated successfully.'
            end
    end
    private
    def profile_params
        params.require(:profile).permit(:name, :gender, :address, :contact_number, :user_id)
    end
end
