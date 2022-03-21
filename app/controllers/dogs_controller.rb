class DogsController < ApplicationController

  def create
    dog = Dog.new(
      name: params[:name],
      age: params[:age],
      breed: params[:breed],
      user_id: current_user.id
    )
    if dog.save
      render json: dog.as_json
    else
      render json: {message: dog.errors.full_messages}
    end
  end

  def update
    dog = Dog.find_by(id: params[:id])
    dog.name = params[:name]
    dog.age = params[:age]
    dog.breed = params[:breed]
    dog.save
  end

end
