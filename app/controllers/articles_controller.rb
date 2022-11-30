class ArticlesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    articles = Article.all.includes(:user).order(created_at: :desc)
    render json: articles, each_serializer: ArticleListSerializer
  end

  def show
    article = Article.find(params[:id])

    session[:page_views] ||= 0
    session[:page_views] += 1 
    
    (session[:page_views] < 4) ? (render json: article) : (render json: {error: "Maximum pageview limit reached"}, status: :unauthorized)
  end

  private

  def record_not_found
    render json: { error: "Maximum pageview limit reached" }, status: :not_found
  end

end
