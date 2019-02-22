class Api::V1::HomesController < ApplicationController

    before_action :find_home, only: [:show, :edit, :update, :destroy]
    def index
        @homes = Home.all
        render json: @homes
      end
    
      def show
        render json: @home
      end

      def new
        @home = home.new
      end
    
      def create
        @home = Home.new(name: params[:name])
        if @home.valid? && @home.save
            render json: { home: HomeSerializer.new(@home) }, status: :created        
        else
          render json: {error: "Unable to create home."}, status: :not_acceptable
        end
      end

      def destroy
        @home.destroy
        redirect_to homes_path
      end

      def signin
        @home = Home.find_by(name: params[:name])
        if @home && @home.authenticate(params[:password])
          render json: {home: @home.name, id: @home.id}
        else
          render json: {error: 'Username/password invalid.'}, status: 400
        end
      end
    
      private
    
        def home_params
          params.require(:home).permit(:name, :id, :password)
        end
    
        def find_home
          @home = Home.find(params[:id])
        end
end
