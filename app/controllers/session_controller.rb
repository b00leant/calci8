class SessionController < Devise::DeviseController

    def after_sign_in_path_for(resource)
        if resource.sign_in_count == 1
           @new_user = 1
           redirect_to root_path
        else
           @new_user = 0
           redirect_to root_path
        end
    end

end
