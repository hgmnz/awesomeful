require File.join(File.dirname(__FILE__), '..', 'spec_helper')

include TruncateHtmlHelper

describe TruncateHtmlHelper do

  it 'should be included in ActionView::Base' do
    ActionView::Base.included_modules.should include(TruncateHtmlHelper)
  end

  describe '#truncate_html' do

    context 'truncating in the middle of a link' do
      before(:each) do
        @html = '<div><ul><li>Look at <a href="foo">this</a> link <li></ul></div>'
      end

      it 'should truncate, and close the <a>, and close any remaining open tags' do
        truncate_html(@html, :length => 10).should == '<div><ul><li>Look at <a href="foo">this...</a></li></ul></div>'
      end
    end

    %w(! @ # $ % ^ & * \( \) - _ + = [ ] { } \ | , . / ?).each do |char|
      context "when the html has a #{char} character after a closing tag" do
        it 'should place the punctuation after the tag without any whitespace' do
          @html = "<p>Look at <strong>this</strong>#{char} More words here</p>"
          truncate_html(@html, :length => 16).should == "<p>Look at <strong>this</strong>#{char} More...</p>"
        end
      end
    end

    #unusual, but just covering my ass
    context 'when the HTML tags are multiline' do 
      before(:each) do
        @html = <<-END_HTML
          <div id="foo"
                class="bar">
          This is ugly html.
          </div>
        END_HTML
      end

      it 'should recognize the multiline html properly' do
        truncate_html(@html, :length=> 6).should == '<div id="foo" class="bar">This is...</div>'
      end
    end

    %w(br hr img).each do |unpaired_tag|
      context "when the html contains a #{unpaired_tag} tag" do

        context "and the #{unpaired_tag} does not have the closing slash" do
          before(:each) do
            @html = "<div>Some before. <#{unpaired_tag}>and some after</div>"
            @html_caps = "<div>Some before. <#{unpaired_tag.capitalize}>and some after</div>"
          end
          it "should not close the #{unpaired_tag} tag" do
            truncate_html(@html, :length => 15).should == "<div>Some before. <#{unpaired_tag}>and...</div>"
            truncate_html(@html_caps, :length => 15).should == "<div>Some before. <#{unpaired_tag.capitalize}>and...</div>"
          end
        end

        context "and the #{unpaired_tag} does not have the closing slash" do
          before(:each) do
            @html = "<div>Some before. <#{unpaired_tag} />and some after</div>"
            @html_caps = "<div>Some before. <#{unpaired_tag.capitalize} />and some after</div>"
          end
          it "should not close the #{unpaired_tag} tag" do
            truncate_html(@html, :length => 15).should == "<div>Some before. <#{unpaired_tag} />and...</div>"
            truncate_html(@html_caps, :length => 15).should == "<div>Some before. <#{unpaired_tag.capitalize} />and...</div>"
          end
        end

      end
    end
  end

end
