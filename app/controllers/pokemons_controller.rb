class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.includes(:type).order(:name)

    if params[:search].present?
      @pokemons = @pokemons.where("name LIKE ?", "%#{params[:search]}%")
    end

    @pokemons = @pokemons.page(params[:page]).per(20)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end