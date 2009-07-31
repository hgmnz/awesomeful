TruncateHtml
============

truncate_html is a Rails helper plugin that [cuts off](http://www.youtube.com/watch?v=6XG4DIOA7nU) a string of HTML and takes care of closing any lingering closing tags. There are many possible solutions to this. This plugin does not have any dependencies, and does all it's work via regular expressions, and it is well spec'ed.

The API is very similar to Rails' own truncate method. 


Example
=======

<pre><code>

some_html = '<ul><li><a href="http://whatever">This is a link</a></li></ul>'

truncate_html(some_html, :length => 5, :omission => 'cont')
  => <ul><li><a href="http://whatever">This is</a></li></ul>

</code></pre>


A few notes:

* It will truncate on a word boundary.
* The default options are:
  * :length => 1000
  * :omission => '...'

Testing
=======

The plugin is tested using rspec. [Install it](http://wiki.github.com/dchelimsky/rspec/rails) on your app if you wish to run the tests.

Copyright (c) 2009 Harold A. Giménez, released under the MIT license
