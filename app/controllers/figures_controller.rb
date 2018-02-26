class FiguresController < ApplicationController

  get '/figures/new' do

    erb :"/figures/new"
  end

  post '/figures/new' do
    @figure =  Figure.create(:name => params[:figure][:name])
    if Title.find_by(:id => params[:figure][:title_ids])
      @figure.titles << Title.find_by(:id => params[:figure][:title_ids])
    else
      @figure.titles << Title.create(:name => params[:title][:name])
    end

    if Landmark.find_by(:id => params[:figure][:landmark_ids])
      @figure.landmarks << Landmark.find_by(:id => params[:figure][:landmark_ids])
    else
    @figure.landmarks << Landmark.create(:name => params[:landmark][:name])
    end

    redirect("/figures/#{@figure.slug}")
  end

end
