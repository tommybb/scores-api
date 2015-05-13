class ResultsController < ApplicationController
  expose(:results)
  expose(:result, attributes: :result_params)

  def create
    if result.save
      redirect_to result_path(result), notice: t('result.result_created')
    else
      render :new
    end
  end

  def update
    if result.update(result_params)
      redirect_to result_path(result), notice: t('result.result_updated')
    else
      render :edit
    end
  end

  def destroy
    result.destroy
    redirect_to results_path, notice: t('result.result_destroyed')
  end

  private

  def result_params
    params.require(:result).permit(:result_date, :score, :user_id, :competition_id)
  end
end
