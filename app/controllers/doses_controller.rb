class DosesController < ApplicationController


  def index
    @doses = Dose.all

  end


  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
  end

  # def create
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @ingredient = Ingredient.find(dose_params[:ingredient_id])
  #   @dose = Dose.new(description: dose_params[:description])
  #   @dose.ingredient = @ingredient
  #   @dose.cocktail = @cocktail
  #   if @dose.save
  #     redirect_to cocktail_dose_path(params[:cocktail_id])
  #   else
  #     render :new
  #   end

  # end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @ingredients = Ingredient.all
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end


  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
