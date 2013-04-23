module ApplicationHelper
  def modal_tag(title, options = {}, &block)
    options = { loading: true }.merge(options)
    locals = { 
      :modal_title => title.nil? ? 'Modal' : title,
      :options => options
    }

    if block_given?
      render :layout => '/layouts/modal', :locals => locals, &block
    else
      render :layout => '/layouts/modal', :locals => locals do 
        if options[:loading] 
          content_tag :span, 'Loading...'
        end
      end
    end
  end
end
