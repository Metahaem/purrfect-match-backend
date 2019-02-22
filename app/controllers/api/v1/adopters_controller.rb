class Api::V1::AdoptersController < ApplicationController
    before_action :find_adopter, only: [:show, :edit, :update, :destroy]
    def index
        @adopters = Adopter.all
        render json: @adopters
      end
    
      def show
        render json: @adopter
      end

      def new
        @adopter = adopter.new
      end
    
    
      def create
        @adopter = Adopter.new(adopter_params)
        if @adopter.valid? && @adopter.save
            render json: { adopter: AdopterSerializer.new(@adopter) }, status: :created        
        else
          render json: {error: "Unable to create adopter."}, status: :not_acceptable
        end
      end

      def destroy
        @adopter.destroy
        redirect_to adopters_path
      end

      def stories
        render json: @adopter.stories
      end

      def signin
        @adopter = Adopter.find_by(name: params[:name])
        if @adopter && @adopter.authenticate(params[:password])
          render json: {adopter: @adopter.name, id: @adopter.id}
        else
          render json: {error: 'Username/password invalid.'}, status: 400
        end
      end
    
      private
    
        def adopter_params
          params.permit(:name, :password, :location)
        end
    
        def find_adopter
          @adopter = Adopter.find(params[:id])
        end
end
