class ImagesController < ApplicationController

  def new
    form Image::Create
  end

  def create
    run Image::Create do |op|
      redirect_to @model
      return
    end
    render action: :new
  end

  def show
    present Image::Update
  end

end
