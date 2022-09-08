class DogsController < ApplicationController
  def index
    @dogs = Dog.all
    render template: "dogs/index"
  end

  def show
    @dog = Dog.find_by(id: params["id"])
    render template: "dogs/show"
  end

  def create
    @dog = Dog.new(
      name: params["name"],
      age: params["age"],
      breed: params["breed"],
    )

    if @dog.save
      render template: "dogs/show"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @dog = Dog.find_by(id: params["id"])

    @dog.name = params["name"] || @dog.name
    @dog.age = params["age"] || @dog.age
    @dog.breed = params["breed"] || @dog.breed

    if @dog.save
      render template: "dogs/show"
    else
      render json: { errors: @dog.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    dog = Dog.find_by(id: params["id"])
    dog.destroy

    render json: { message: "The dog has successfully been destroyed." }
  end
end
