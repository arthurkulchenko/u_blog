module Api
  module V1
    class Users < Grape::API
      include Api::V1::Defaults

      resource :users do

        desc "Return all users"
        get "", root: :users do
          User.all
        end

        desc "Return a user"
        params do
          requires :id, type: String, desc: "ID of the user"
        end
        get ":id", root: "user" do
          User.where(id: permitted_params[:id]).first!
        end

        

        # desc "Create a new user"
        # post '', root: :users do
        #   CreateNewUserService.perform users_params
        # end

        # params do
        #   requires :users, type: String , desc: 'provide your login'
        # end
        post "" do
          # authenticate!
          CreateNewUserService.perform params[:user]

          # Status.create!({
          #   user: current_user,
          #   text: params[:status]
          # })
        end


      end
    end
  end
end  