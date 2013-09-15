module BlogsHelper
  def link_to_blog(blog, options={})
    title = options.delete(:title) || blog.title
    link_to title, blog_with_slug_path({id: blog.id, slug: blog.slug}), options
  end
end
