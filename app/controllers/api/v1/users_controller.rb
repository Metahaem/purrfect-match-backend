class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :login, :validate]
   
    def index
        @users = User.all
        render json: @users
    end

    def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def show
        render json: @user
    end

    def new
        @user = user.new
    end
   
    def create
      @user = User.new(username: params[:username], password: params[:password])
      if @user.valid? && @user.save
        @token = decoded_token
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end

    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            
            render json: {username: @user.username, token: issue_token(user_id: @user.id) }
        else
            
            render json: {error: "Username/password invalid"}, status: 400
        end
    end
   
    def validate
        # debugger
        @user = current_user
        
        if @user
            render json: {username: @user.username, id: @user_id }
        else
            render json: {error: "Username/password invalid"}, status: 400
        end
    end

    def get_likes
        @user = current_user
        if @user
            render json: @user.likes
        else
            render json: {error: "Not a valid user"}, status: 401
        end
    end

    def get_adopter
        @user = current_user
        if @user
            if @user.adopters.length > 0 
                render json: @user.adopters.first.id
            else
                Adopter.create(user_id: @user.id)
            end
        else
            render json: {error: "Not a valid user"}, status: 401
        end
    end


 
    private
   
    def user_params
      params.permit(:username, :password, :bio, :avatar)
    end
  end