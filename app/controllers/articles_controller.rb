class ArticlesController < ApplicationController
  before_action :set_article, only: [:update, :destroy]

  def index
    @articles = Article.all
    @article = Article.new
  end

  def edit
    @editing_article = Article.find(params[:id])
    @articles = Article.all
    render :index
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: "Article was successfully created."
    else
      @articles = Article.all
      render :index
    end
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: "Article was successfully updated."
    else
      @articles = Article.all
      render :index
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Article was successfully deleted."
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
