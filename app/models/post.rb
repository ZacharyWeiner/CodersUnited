class Post < ActiveRecord::Base
	include PublicActivity::Model

	belongs_to :user 
	validates_presence_of :user_id 
	validates_presence_of :user_id 

  auto_html_for :content do
    html_escape
    image
    youtube(:width => "100%", :height => 250, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  def body_html
    auto_html(self[:content]) { html_escape;
    image(:width => 500, :height => 300, class: "responsive");
    youtube(:width => "100%", :height => 250, :autoplay => false);
    link( :target => "_blank", :rel => "nofollow");
    simple_format; }
  end
end
