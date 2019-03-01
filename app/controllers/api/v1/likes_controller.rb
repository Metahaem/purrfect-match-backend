class Api::V1::LikesController < ApplicationController
    before_action :find_like, only: [:show, :edit, :update, :destroy]
      
    def index
        @likes = Like.all
        render json: @likes
    end
    
    
    def create
      #check to see if like already exists
      if !!(Like.all.find{|like| like.adopter_id == params[:adopter_id] && like.pet_id == params[:pet_id]})
        render json: "You already like this animal!", status: :not_acceptable
      else

        @like = Like.new(like_params)
        if @like.valid? && @like.save
            render json: { like: LikeSerializer.new(@like) }, status: :created        
        else
          render json: {error: "Unable to create like."}, status: :not_acceptable
        end
      end
    end


      def delete
        @like = Like.find{|like| (like.adopter_id == params[:adopter_id]) && (like.pet_id == params[:pet_id])}
        @like.destroy
    end

    
      private
    
        def like_params
          params.permit(:adopter_id, :pet_id)
        end
    
        def find_like
          @like = Like.find(params[:id])
        end

end
