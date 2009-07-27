# http://gist.github.com/97425
module TextHelper
  def truncate_html(html, options={})
    previous_tag = ""
    text, result = [], []

    # get all text (including punctuation) and tags and stick them in a hash
    html.scan(/<\/?[^>]*>|[A-Za-z.,;!"'?]+/).each { |t| text << t }

    text.each do |str|
      if options[:length] > 0
        if str =~ /<\/?[^>]*>/
          previous_tag = str
          result << str
        else
          result << str
          options[:length] -= str.length
        end
      else
        # now stick the next tag with a </> that matches the previous open tag on the end of the result
        if str =~ /<\/([#{previous_tag}]*)>/
          result << str
        else
        end
      end
    end
    return result.join(" ") + options[:omission].to_s
  end
end
