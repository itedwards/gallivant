class StaticController < ApplicationController
  def create
    # try to create new session by authenticating user object sent from the front end
    user = User
            .find_by(email: params["user"]["email"])
            .try(:authenticate, params["user"]["password"])

    # if user is successfully authenticated, tell the session to set the user and create the cookie
    if user
      session[:user_id] = user.id

      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: {
        status: 401
      }
    end
  end

end
