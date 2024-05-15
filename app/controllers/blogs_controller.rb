class BlogsController < ApplicationController
  def index
    @q = Blog.ransack(params[:q])
    @blogs = @q.result(distinct: true)
    @blogs = Blog.all if @q.result.none?

     # Check if category filter parameter is present
     if params[:cate].present?
      @blogs = @blogs.where(category_id: params[:cate])
    end

    # Paginate the filtered blogs
    @pagy, @blogs = pagy(@blogs)

    # Retrieve all categories for the sidebar
    @categories = Category.all

  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)

    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: 'Blog was successfully destroyed.'
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content, :category_id, :image)
  end

end
