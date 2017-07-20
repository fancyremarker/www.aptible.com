require 'cgi'

module AptibleHelpers
  # Determine what the page title should be
  def page_title
    pg_title = @title || current_page.data.title

    case pg_title
    when ['Aptible Blog', 'Aptible', 'Aptible Support'].include?(pg_title)
      return pg_title
    when current_page.url.include?('/blog')
      return "#{pg_title} | Aptible Blog"
    when current_page.url.include?('/support')
      return "#{pg_title} | Aptible Support"
    end

    "#{pg_title} | Aptible"
  end

  def page_description
    current_page.data.description || @description ||
      current_page.data.header_subtitle || current_page.data.excerpt || ''
  end

  def page_image
    img_src = current_page.data.image || 'meta/page-image.png'
    # Needs the fingerprinted filename from asset_path, but can't find an
    # absolute path option, hence this sad hack to replace `../`.
    "#{base_url}/#{asset_path(:images, img_src).gsub(%r{\.\.\/}, '')}"
  end

  def page_url
    "#{base_url}#{current_page.url}"
  end

  def section_pages(section)
    sitemap.resources.select { |p| p.data['section'] == section }
  end

  def twitter_follow_url
    escaped_url = URI.escape("https://www.aptible.com/#{current_page.path}")

    'https://twitter.com/intent/follow?' \
      "original_referer=#{escaped_url}&" \
      'ref_src=twsrc%5Etfw&region=follow_link&' \
      'screen_name=aptible&tw_p=followbutton'
  end

  def quickstart?(url)
    url.include? 'support/quickstart'
  end

  def support_topic?(url)
    url.include? 'support/topics'
  end

  def active_nav_item(path)
    match = current_page.url.include?(path) || current_page.url == path
    match ? 'nav-item--active' : ''
  end

  def quickstart_index_href(language)
    if (language.articles && language.articles.count == 1) || !language.articles
      "/support/quickstart/#{language.url}/"
    else
      "/support/quickstart/#{language.slug}/"
    end
  end

  def legal_sections
    sitemap.resources
           .select { |p| p.data['section'] == 'Legal' }
           .group_by { |p| p.data['sub_section'] }.keys.sort
  end

  def legal_section(sub_section)
    l = sitemap.resources
               .select do |p|
                 p.data['section'] == 'Legal' &&
                   p.data['sub_section'] == sub_section &&
                   p.url != '/legal/'
               end
    l.sort_by { |p| p.data['order'] }
  end

  def display_date(string_date)
    string_date.strftime('%B %e, %Y')
  end

  def dashboard_href
    'https://dashboard.aptible.com/login'
  end

  def open_account_href
    'https://dashboard.aptible.com/signup'
  end

  def contact_href
    # 'https://aptible.zendesk.com/hc/en-us/requests/new'
    'http://contact.aptible.com'
  end

  def status_href
    'http://status.aptible.com/'
  end

  def community_href
    'https://community.aptible.com/'
  end
end
