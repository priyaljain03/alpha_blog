class ArticlesController<ApplicationController
    
    def new
        @article=Article.new
    end
    
    def index
     @articles=Article.paginate(page: params[:page],per_page:5)
        
    end
    
    def edit
        @article=Article.find(params[:id])
        
    end
    
    def create
        @article=Article.new(article_params)
        @article.user=User.first
        if  @article.save
            flash[:success]="Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def show
        @article=Article.find(params[:id])
        
    end
    
    def update
        @article=Article.find(params[:id])
        if @article.update(article_params)
            flash[:success]="Article was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
        
    end
    
    
        
    
    private
        def article_params
            params.require(:article).permit(:title,:description)
        end
end

    
    
