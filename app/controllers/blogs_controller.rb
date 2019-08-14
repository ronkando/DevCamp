class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggl_status]
  layout "blogs"
  # access all: [:show, :index], user: {except: [:destroy, :new, :create , :update, :edit]}, site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def index
    # binding.pry
    @blogs = Blog.page(params[:page]).per(3)
    # binding.pry
    # @blogs = Blog.get_with_limit
    # binding.pry
      #byebug
    # puts "*" * 100
    # puts @blogs.inspect
    # puts "*" * 100

    # @page_title = "Blog Page"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @page_title   =  @blog.title
    @seo_keywords = @blog.body
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    Rails.logger.info @blog.inspect
  end

def toggl_status

   if @blog.draft?
     @blog.published!
      elsif @blog.published?
     @blog.draft!
     end

  redirect_to blog_path, notice: 'Post has been updated'

end
  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def   set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end

end
