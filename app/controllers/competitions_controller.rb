class CompetitionsController < ApplicationController
  expose(:competitions)
  expose(:competition, attributes: :competition_params)

  def create
    if competition.save
      redirect_to competition_path(competition), notice: 'Competition was successfully created.'
    else
      render :new
    end
  end

  def update
    if competition.update(competition_params)
      redirect_to competition_path(competition), notice: 'Competition was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    competition.destroy
    redirect_to competitions_path, notice: 'Competition was successfully destroyed.'
  end

  private

  def competition_params
    params.require(:competition).permit(:name)
  end
end
