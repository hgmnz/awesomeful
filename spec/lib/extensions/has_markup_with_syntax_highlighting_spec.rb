require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '../../../../lib/extensions/has_markup_with_syntax_highlighting')

describe 'HasMarkupWithSyntaxHighlightingSpec' do
  #specing this directly on my Post model is sufficient for now
  context 'a new post without any code' do
    before(:each) do
      @post = Factory(:post, :body => 'hi')
    end

    describe 'saving the post' do
      before(:each) do
        @post.save
      end

      it 'should save cached html' do
        @post.cached_body_html.should == '<p>hi</p>'
      end
    end

  end

  context 'a new post with an inline code snippet' do
    before(:each) do
      @post = Factory(:post, :body => 'before. <highlight>puts "hey there"</highlight>. after.')
    end

    describe 'saving the post' do
      before(:each) do
        @post.save
      end

      it 'should save cached html and substitute the highlight tag with an inline code tag' do
        @post.cached_body_html.should == '<p>before. <code class="inline">puts <span class="s"><span class="dl">&quot;</span><span class="k">hey there</span><span class="dl">&quot;</span></span></code>. after.</p>'
      end
    end

  end

  context 'a new post with a multiline code snippet' do
    before(:each) do
      @post = Factory(:post, :body => <<-END_BODY)
'before. <highlight>puts "hey there"
puts "KTHXBAI"</highlight>. after.'
END_BODY
    end

    describe 'saving the post' do
      before(:each) do
        @post.save
      end

      it 'should save cached html and substitute the highlight tag with an inline code tag' do
        @post.cached_body_html.should == <<-END_EXPECTATION.strip
<p>'before. <div><pre><code class="multiline">puts <span class="s"><span class="dl">&quot;</span><span class="k">hey there</span><span class="dl">&quot;</span></span>
puts <span class="s"><span class="dl">&quot;</span><span class="k">KTHXBAI</span><span class="dl">&quot;</span></span></code></pre></div>. after.'</p>
END_EXPECTATION
      end
    end

  end
  

end
