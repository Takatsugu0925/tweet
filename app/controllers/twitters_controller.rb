class TwittersController < ApplicationController
  before_action :set_twitter, only: [:edit, :update, :destroy]
  
  def index
    @twitters = Tweet.all
  end

  def new
    if params[:back]
      @twitter = Tweet.new(twitters_params)
    else
      @twitter = Tweet.new
    end
  end

  def create
    @twitter = Tweet.new(twitters_params)
    if @twitter.save
      redirect_to twitters_path, notice: "つぶやきました！"
    else
      render 'new'
    end
  end
  
  def edit
    @twitter = Tweet.find(params[:id])
  end
  
  def update
    @twitter = Tweet.find(params[:id])
    @twitter.update(twitters_params)
    if @twitter.save
      redirect_to twitters_path, notice: "つぶやきました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @twitter = Tweet.find(params[:id])
    @twitter.destroy
    redirect_to twitters_path, notice: "削除しました"
  end
  
  def confirm
    @twitter = Tweet.new(twitters_params)
    render :new if @twitter.invalid?
  end
  
  private
    def twitters_params
      params.require(:tweet).permit(:content)
    end

    def set_twitter
      @twitter = Tweet.find(params[:id])
    end
end