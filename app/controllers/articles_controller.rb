class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    
    
    def index
        @article_sort = Article.order(:id).reverse_order
        @articles = @article_sort.paginate(page: params[:page], per_page: 7)
    end
    
    def new
    @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
            flash[:success] = "Article was successfully created"
            redirect_to article_path(@article)
            
        else
            render 'new'
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @article.update(article_params)
            flash[:success] = "Article was successfully updated"
            redirect_to user_path(current_user)
        else
            render 'edit'
        end
    end
    
    def destroy
        @article.destroy
        flash[:success] = "The Article was successfully deleted"
        redirect_to user_path(current_user)
    end
    
    private
        def article_params
            params.require(:article).permit(:title, :description)
        end
        
        def set_article
            @article = Article.find(params[:id])
        end
        
        def require_same_user
           if current_user != @article.user and !current_user.admin?
               flash[:danger] = "You can only edit or delete your own articles"
               redirect_to root_path
           end
        end
        
        def require_user
           if !logged_in?
               flash[:danger] = "Please login to perform this action"
               redirect_to root_path
           end
        end
end