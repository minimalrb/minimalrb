get '/' do
  @index = RDiscount.new( File.open("contents/index.md").read ).to_html
  haml :index
end

get '/:article' do
  @content = RDiscount.new( File.open("contents/" + params["article"].gsub("-", "_").concat(".md")).read ).to_html
  doc_title = Nokogiri::HTML::DocumentFragment.parse( @content ).css('h1').inner_html()  
  @title = "#{doc_title} | No title available"
  haml :article
end