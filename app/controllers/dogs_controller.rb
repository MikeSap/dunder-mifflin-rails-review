class DogsController < ApplicationController

    before_action :set_dog, only: [:show, :edit, :update]

    def index
        @dogs = Dog.all
    end

    def show        
    end

 


    private

    def set_dog
        @dog = Dog.find_by_id(params[:id])
    end
end
