require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do

  describe 'Post#published' do

    context 'when published_at is nil' do
      before(:each) do
        @post = Factory.build(:post, :published_at => nil)
      end

      it 'should be false' do
        @post.published.should be_false
      end
    end

    context 'when published_at is a Time' do
      before(:each) do
        @post = Factory.build(:post, :published_at => Time.now)
      end

      it 'should be true' do
        @post.published.should be_true
      end
    end

  end

  describe 'Post#published=' do

    context "when the post doesn't have a published_at of nil" do
      before(:each) do
        @pub_date = Time.now.beginning_of_month.beginning_of_day
        @post = Factory.create(:post, :published_at => @pub_date)
      end

      context 'when the published value is "1"' do
        before(:each) do
          @post.published = "1"
        end

        it 'should not change the published_at date' do
          @post.save
          @post.published_at.should == @pub_date
        end
      end

      context 'when the published value is "0"' do
        before(:each) do
          @post.published = "0"
        end

        it 'should set the published_at to nil' do
          @post.save
          @post.published_at.should be_nil
        end
      end

    end
    
  end

end
