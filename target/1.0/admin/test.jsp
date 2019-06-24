<%--
  Created by IntelliJ IDEA.
  User: 13055
  Date: 2019/6/23
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        <html>
        <head>
            <title>Bootstrap Tags Input</title>
            <meta name="robots" content="index, follow" />
            <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap.min.css">
            <link rel="stylesheet" href="../dist/bootstrap-tagsinput.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/themes/github.css">
            <link rel="stylesheet" href="http://getbootstrap.com/2.3.2/assets/css/docs.css">
            <link rel="stylesheet" href="assets/app.css">
            <style>
                .accordion { margin-top:-19px; }
            </style>
            <script>
                (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
                ga('create', 'UA-42755476-1', 'timschlechter.github.io');
                ga('send', 'pageview');
            </script>
        </head>
<body>
<div id="fb-root"></div>
<div class="navbar navbar-inverse navbar-fixed-top bs-docs-nav">
    <div class="navbar-inner">
        <div class="container">
            <div class="nav-collapse collapse bs-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="https://github.com/timschlechter/bootstrap-tagsinput">Code on Github</a>
                    </li>
                    <li>
                        <a href=".">Bootstrap 3</a>
                    </li>
                    <li>
                        <a href="http://timschlechter.github.io/bootstrap-tagsinput/dist/bootstrap-tagsinput.zip">Download <small>(latest)</small></a>
                    </li>
                </ul>
                <p class="navbar-text pull-right">
                    <a href="https://twitter.com/share" class="navbar-link twitter-share-button"
                       data-hashtags="bootstraptagsinput">Tweet</a>
                    <script>!function (d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (!d.getElementById(id)) {
                            js = d.createElement(s);
                            js.id = id;
                            js.src = "//platform.twitter.com/widgets.js";
                            fjs.parentNode.insertBefore(js, fjs);
                        }
                    }(document, "script", "twitter-wjs");</script>

                    <!-- Place this tag where you want the +1 button to render. -->
                    <a class="navbar-link g-plusone" data-size="medium"></a>

                    <!-- Place this tag after the last +1 button tag. -->
                    <script type="text/javascript">
                        (function () {
                            var po = document.createElement('script');
                            po.type = 'text/javascript';
                            po.async = true;
                            po.src = 'https://apis.google.com/js/plusone.js';
                            var s = document.getElementsByTagName('script')[0];
                            s.parentNode.insertBefore(po, s);
                        })();
                    </script>
                    <script>(function(d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) return;
                        js = d.createElement(s); js.id = id;
                        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=122064240555";
                        fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));</script>
                    <a class="navbar-link fb-like" data-href="http://timschlechter.github.io/bootstrap-tagsinput/examples/" data-width="110" data-layout="button_count" data-show-faces="true" data-send="false"></a>
                </p>
            </div>
        </div>
    </div>
</div>
<header class="jumbotron subhead">
    <div class="container">
        <h1>Bootstrap Tags Input</h1>
        <p>jQuery plugin providing a Twitter Bootstrap user interface for managing tags</p>
</header>
<div class="container">
    <section id="examples">
        <div class="page-header">
            <h2>Examples</h2>
        </div>

        <div class="example example_markup">
            <h3>Markup</h3>
            <p>
                Just add <code>data-role="tagsinput"</code> to your input field to automatically change it to a tags input field.
            </p>
            <div class="bs-docs-example">
                <input type="text" value="Amsterdam,Washington,Sydney,Beijing,Cairo" data-role="tagsinput" placeholder="Add tags" />
            </div>
            <div class="accordion">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" href="#accordion_example_markup">
                            Show code
                        </a>
                    </div>
                    <div id="accordion_example_markup" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <pre><code data-language="html">&lt;input type=&quot;text&quot; value=&quot;Amsterdam,Washington,Sydney,Beijing,Cairo&quot; data-role=&quot;tagsinput&quot; placeholder=&quot;Add tags&quot; /&gt;</code></pre>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-bordered table-condensed"><thead><tr><th>statement</th><th>returns</th></tr></thead><tbody><tr><td><code>$("input").val()</code></td><td><pre class="val"><code data-language="javascript"></code></pre></td></tr><tr><td><code>$("input").tagsinput('items')</code></td><td><pre class="items"><code data-language="javascript"></code></pre></td></tr></tbody></table>
        </div>

        <div class="example example_multivalue">
            <h3>True multi value</h3>
            <p>
                Use a <code>&lt;select multiple /&gt;</code> as your input element for a tags input, to gain true multivalue support. Instead of a comma separated string, the values will be set in an array. Existing <code>&lt;option /&gt;</code> elements will automatically be set as tags. This makes it also possible to create tags containing a comma.
            </p>
            <div class="bs-docs-example">
                <select multiple data-role="tagsinput">
                    <option value="Amsterdam">Amsterdam</option>
                    <option value="Washington">Washington</option>
                    <option value="Sydney">Sydney</option>
                    <option value="Beijing">Beijing</option>
                    <option value="Cairo">Cairo</option>
                </select>
            </div>
            <div class="accordion ">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" href="#example_multivalue">
                            Show code
                        </a>
                    </div>
                    <div id="example_multivalue" class="accordion-body collapse">
                        <div class="accordion-inner">
                  <pre><code data-language="html">&lt;select multiple data-role="tagsinput"&gt;
  &lt;option value="Amsterdam"&gt;Amsterdam&lt;/option&gt;
  &lt;option value="Washington"&gt;Washington&lt;/option&gt;
  &lt;option value="Sydney"&gt;Sydney&lt;/option&gt;
  &lt;option value="Beijing"&gt;Beijing&lt;/option&gt;
  &lt;option value="Cairo"&gt;Cairo&lt;/option&gt;
&lt;/select&gt;</code></pre>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-bordered table-condensed"><thead><tr><th>statement</th><th>returns</th></tr></thead><tbody><tr><td><code>$("select").val()</code></td><td><pre class="val"><code data-language="javascript"></code></pre></td></tr><tr><td><code>$("select").tagsinput('items')</code></td><td><pre class="items"><code data-language="javascript"></code></pre></td></tr></tbody></table>
        </div>

        <div class="example example_typeahead">
            <h3>Typeahead</h3>
            <div class="bs-docs-example">
                <input type="text" value="Amsterdam,Washington" />
            </div>
            <div class="accordion ">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse"href="#example_typeahead">
                            Show code
                        </a>
                    </div>
                    <div id="example_typeahead" class="accordion-body collapse">
                        <div class="accordion-inner">
                  <pre><code data-language="html">&lt;input type=&quot;text&quot; value=&quot;Amsterdam,Washington&quot; data-role=&quot;tagsinput&quot; /&gt;
&lt;script&gt;
$('input').tagsinput({
  typeahead: {
    source: function(query) {
      return $.getJSON('citynames.json');
    }
  }
});
&lt;/script&gt;</code></pre>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-bordered table-condensed"><thead><tr><th>statement</th><th>returns</th></tr></thead><tbody><tr><td><code>$("input").val()</code></td><td><pre class="val"><code data-language="javascript"></code></pre></td></tr><tr><td><code>$("input").tagsinput('items')</code></td><td><pre class="items"><code data-language="javascript"></code></pre></td></tr></tbody></table>
        </div>

        <div class="example example_objects_as_tags">
            <h3>Objects as tags</h3>
            <p>
                Instead of just adding strings as tags, bind objects to your tags. This makes it possible to set id values in your input field's value, instead of just the tag's text.
            </p>
            <div class="bs-docs-example">
                <input type="text" />
            </div>
            <div class="accordion">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" href="#accordion_example_objects_as_tags">
                            Show code
                        </a>
                    </div>
                    <div id="accordion_example_objects_as_tags" class="accordion-body collapse">
                        <div class="accordion-inner">
                  <pre><code data-language="html">&lt;input type=&quot;text&quot; /&gt;
&lt;script&gt;
$('input').tagsinput({
  itemValue: 'value',
  itemText: 'text',
  typeahead: {
    source: function(query) {
      return $.getJSON('cities.json');
    }
  }
});

$('input').tagsinput('add', { "value": 1 , "text": "Amsterdam"  });
$('input').tagsinput('add', { "value": 4 , "text": "Washington" });
$('input').tagsinput('add', { "value": 7 , "text": "Sydney"     });
$('input').tagsinput('add', { "value": 10, "text": "Beijing"    });
$('input').tagsinput('add', { "value": 13, "text": "Cairo"      });
&lt;/script&gt;</code></pre>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-bordered table-condensed"><thead><tr><th>statement</th><th>returns</th></tr></thead><tbody><tr><td><code>$("input").val()</code></td><td><pre class="val"><code data-language="javascript"></code></pre></td></tr><tr><td><code>$("input").tagsinput('items')</code></td><td><pre class="items"><code data-language="javascript"></code></pre></td></tr></tbody></table>
        </div>

        <div class="example example_tagclass">
            <h3>Categorizing tags</h3>
            <p>
                You can set a fixed css class for your tags, or determine dynamically by providing a custom function.
            </p>
            <div class="bs-docs-example">
                <input type="text" />
            </div>
            <div class="accordion">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" href="#accordion_example_tagclass">
                            Show code
                        </a>
                    </div>
                    <div id="accordion_example_tagclass" class="accordion-body collapse">
                        <div class="accordion-inner">
                  <pre><code data-language="html">&lt;input type=&quot;text&quot; /&gt;
&lt;script&gt;
$('input').tagsinput({
  tagClass: function(item) {
    switch (item.continent) {
      case 'Europe'   : return 'label label-info';
      case 'America'  : return 'label label-important';
      case 'Australia': return 'label label-success';
      case 'Africa'   : return 'badge badge-inverse';
      case 'Asia'     : return 'badge badge-warning';
    }
  },
  itemValue: 'value',
  itemText: 'text',
  typeahead: {
    source: function(query) {
      return $.getJSON('cities.json');
    }
  }
});

$('input').tagsinput('add', { "value": 1 , "text": "Amsterdam"   , "continent": "Europe"    });
$('input').tagsinput('add', { "value": 4 , "text": "Washington"  , "continent": "America"   });
$('input').tagsinput('add', { "value": 7 , "text": "Sydney"      , "continent": "Australia" });
$('input').tagsinput('add', { "value": 10, "text": "Beijing"     , "continent": "Asia"      });
$('input').tagsinput('add', { "value": 13, "text": "Cairo"       , "continent": "Africa"    });
&lt;/script&gt;</code></pre>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-bordered table-condensed"><thead><tr><th>statement</th><th>returns</th></tr></thead><tbody><tr><td><code>$("input").val()</code></td><td><pre class="val"><code data-language="javascript"></code></pre></td></tr><tr><td><code>$("input").tagsinput('items')</code></td><td><pre class="items"><code data-language="javascript"></code></pre></td></tr></tbody></table>
        </div>

        <div id="angular" class="example example_angular" ng-app="AngularExample" ng-controller="CityTagsInputController">
            <h3>AngularJS support</h3>
            <p>
                Include <code>bootstrap-tagsinput-angular.js</code> and register the 'bootstrap-tagsinput' in your Angular JS application to use the bootstrap-tagsinput directive.
            </p>
            <div class="bs-docs-example">
                <bootstrap-tagsinput
                        ng-model="cities"
                        typeahead-source="queryCities"
                        tagclass="getTagClass"
                        itemvalue="value"
                        itemtext="text">
                </bootstrap-tagsinput>
            </div>
            <div class="accordion">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" href="#example_angular">
                            Show code
                        </a>
                    </div>
                    <div id="example_angular" class="accordion-body collapse">
                        <div class="accordion-inner">
                  <pre><code data-language="html">&lt;bootstrap-tagsinput
  ng-model="cities"
  typeahead-source="queryCities"
  tagclass="getTagClass"
  itemvalue="value"
  itemtext="text"&gt;
&lt;/bootstrap-tagsinput&gt;

&lt;script&gt;
angular.module('AngularExample', ['bootstrap-tagsinput'])
  .controller('CityTagsInputController',
    function CityTagsInputController($scope) {
      // Init with some cities
      $scope.cities = [
        { "value": 1 , "text": "Amsterdam"   , "continent": "Europe"    },
        { "value": 4 , "text": "Washington"  , "continent": "America"   },
        { "value": 7 , "text": "Sydney"      , "continent": "Australia" },
        { "value": 10, "text": "Beijing"     , "continent": "Asia"      },
        { "value": 13, "text": "Cairo"       , "continent": "Africa"    }
      ];

      $scope.queryCities = function(query) {
        return $http.get('cities.json');
      };

      $scope.getTagClass = function(city) {
        switch (city.continent) {
          case 'Europe'   : return 'badge badge-info';
          case 'America'  : return 'label label-important';
          case 'Australia': return 'badge badge-success';
          case 'Africa'   : return 'label label-inverse';
          case 'Asia'     : return 'badge badge-warning';
        }
      };
    }
  );
&lt;/script&gt;</code></pre>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-bordered table-condensed">
                <thead>
                <tr><th>statement</th><th>returns</th></tr>
                </thead>
                <tbody>
                <tr><td><code>$scope.cities</code></td><td><pre><code data-language="javascript">{{cities}}</code></pre></td></tr>
                <tr><td><code>$("select").val()</code></td><td><pre class="val"><code data-language="javascript"></code></pre></td></tr>
                <tr><td><code>$("select").tagsinput('items')</code></td><td><pre class="items"><code data-language="javascript"></code></pre></td></tr>
                </tbody>
            </table>
        </div>
    </section>

    <section id="options">
        <div class="page-header">
            <h2>Options</h2>
        </div>
        <table class="table table-bordered table-condensed">
            <thead>
            <tr>
                <th colspan="2">option</th>
                <th>description</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td colspan="2"><code>tagClass</code></td>
                <td>
                    <p>Classname for the tags, or a function returning a classname</p>
                    <pre><code data-language="javascript">$('input').tagsinput({
  tagClass: 'big'
});</code></pre>
                    <pre><code data-language="javascript">$('input').tagsinput({
  tagClass: function(item) {
    return (item.length > 10 ? 'big' : 'small');
  }
});</code></pre>
                </td>
            </tr>
            <tr>
                <td colspan="2"><code>itemValue</code></td>
                <td>
                    <p>When adding objects as tags, itemValue <em>must</em> be set to the name of the property containing the item's value, or a function returning an item's value.</p>
                    <pre><code data-language="javascript">$('input').tagsinput({
    itemValue: 'id'
});</code></pre>
                    <pre><code data-language="javascript">$('input').tagsinput({
  itemValue: function(item) {
    return item.id;
  }
});</code></pre>
                </td>
            </tr>
            <tr>
                <td colspan="2"><code>itemText</code></td>
                <td>
                    <p>When adding objects as tags, you can set itemText to the name of the property of item to use for a its tag's text. You may also provide a function which returns an item's value. When this options is not set, the value of <code>itemValue</code> will be used.


                    <pre><code data-language="javascript">$('input').tagsinput({
  itemText: 'label'
});</code></pre>
                    <pre><code data-language="javascript">$('input').tagsinput({
  itemText: function(item) {
    return item.label;
  }
});</code></pre>
                </td>
            </tr>
            <tr>
                <td colspan="2"><code>confirmKeys</code></td>
                <td>
                    <p>Array of keycodes which will add a tag when typing in the input. (default: [13, 188], which are ENTER and comma)</p>
                    <pre><code data-language="javascript">$('input').tagsinput({
  confirmKeys: [13, 44]
});</code></pre>
                </td>
            </tr>
            <tr>
                <td colspan="2"><code>maxTags</code></td>
                <td>
                    <p>When set, no more than the given number of tags are allowed to add (default: undefined). When maxTags is reached, a class 'bootstrap-tagsinput-max' is placed on the tagsinput element. (default: undefined)</p>
                    <pre><code data-language="javascript">$('input').tagsinput({
  maxTags: 3
});</code></pre>
                </td>
            </tr>
            <tr>
                <td colspan="2"><code>maxChars</code></td>
                <td>
                    <p>Defines the maximum length of a single tag. (default: undefined)</p>
                    <pre><code data-language="javascript">$('input').tagsinput({
  maxChars: 8
});</code></pre>
                </td>
            </tr>
            <tr>
                <td colspan="2"><code>trimValue</code></td>
                <td>
                    <p>When true, automatically removes all whitespace around tags. (default: false)</p>
                    <pre><code data-language="javascript">$('input').tagsinput({
  trimValue: true
});</code></pre>
                </td>
            </tr>
            <tr>
                <td colspan="2"><code>allowDuplicates</code></td>
                <td>
                    <p>When true, the same tag can be added multiple times. (default: false)</p>
                    <pre><code data-language="javascript">$('input').tagsinput({
  allowDuplicates: true
});</code></pre>
                </td>
            </tr>
            <tr>
                <td colspan="2"><code>maxChars</code></td>
                <td>
                    <p>Defines the maximum length of a single tag.</p>
                    <pre><code data-language="javascript">$('input').tagsinput({
  maxChars: 8
});</code></pre>
                </td>
            </tr>
            <tr>
                <td colspan="2"><code>freeInput</code></td>
                <td>
                    <p>Allow creating tags which are not returned by typeahead's source (default: true)</p>
                    <div class="alert alert-block">
                        This is only possible when using string as tags. When itemValue option is set, this option will be ignored.
                    </div>
                    <pre><code data-language="javascript">$('input').tagsinput({
  typeahead: {
    source: ['Amsterdam', 'Washington', 'Sydney', 'Beijing', 'Cairo'],
    freeInput: true
  }
});</code></pre>
                </td>
            </tr>
            <tr>
                <td colspan="2"><code>typeahead</code></td>
                <td><p>Object containing typeahead specific options</td>
            </tr>
            </tr>
            <tr>
                <td></td>
                <td><code>source</code></td>
                <td>
                    <p>An array (or function returning a promise or array), which will be used as source for a typeahead.
                    <pre><code data-language="javascript">$('input').tagsinput({
  typeahead: {
    source: ['Amsterdam', 'Washington', 'Sydney', 'Beijing', 'Cairo']
  }
});</code></pre>
                    <pre><code data-language="javascript">$('input').tagsinput({
  typeahead: {
    source: function(query) {
      return $.get('http://someservice.com');
    }
  }
});</code></pre>
                </td>
            </tr>
            <tr>
                <td colspan="2"><code>onTagExists</code></td>
                <td><p>Function invoked when trying to add an item which allready exists. By default, the existing tag hides and fades in.
                    <pre><code data-language="javascript">$('input').tagsinput({
  onTagExists: function(item, $tag) {
    $tag.hide.fadeIn();
  }
});</code></pre>
                </td>
            </tr>
            </tbody>
        </table>
    </section>

    <section id="methods">
        <div class="page-header">
            <h2>Methods</h2>
        </div>
        <table class="table table-bordered table-condensed">
            <thead>
            <tr>
                <th>method</th>
                <th>description</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><code>add</code></td>
                <td>
                    <p>Adds a tag</p>

                    <pre><code data-language="javascript">$('input').tagsinput('add', 'some tag');</code></pre>

                    <pre><code data-language="javascript">$('input').tagsinput('add', { id: 1, text: 'some tag' });</code></pre>
                </td>
            </tr>
            <tr>
                <td><code>remove</code></td>
                <td>
                    <p>Removes a tag</p>

                    <pre><code data-language="javascript">$('input').tagsinput('remove', 'some tag');</code></pre>

                    <pre><code data-language="javascript">$('input').tagsinput('remove', { id: 1, text: 'some tag' });</code></pre>
                </td>
            </tr>
            <tr>
                <td><code>removeAll</code></td>
                <td>
                    <p>Removes all tags</p>

                    <pre><code data-language="javascript">$('input').tagsinput('removeAll');</code></pre>
                </td>
            </tr>
            <tr>
                <td><code>focus</code></td>
                <td>
                    <p>Sets focus in the tagsinput</p>

                    <pre><code data-language="javascript">$('input').tagsinput('focus');</code></pre>
                </td>
            </tr>
            <tr>
                <td><code>input</code></td>
                <td>
                    <p>Returns the tagsinput's internal &lt;input /&gt;, which is used for adding tags. You could use this to add your own typeahead behaviour for example.</p>


                    <pre><code data-language="html">var $elt = $('input').tagsinput('input');</code></pre>
                </td>
            </tr>
            <tr>
                <td><code>refresh</code></td>
                <td>
                    <p>Refreshes the tags input UI. This might be usefull when you're adding objects as tags. When an object's text changes, you'll have to refresh to update the matching tag's text.</p>

                    <pre><code data-language="javascript">$('input').tagsinput('refresh');</code></pre>
                </td>
            </tr>
            <tr>
                <td><code>destroy</code></td>
                <td>
                    <p>Removes tagsinput behaviour</p>

                    <pre><code data-language="javascript">$('input').tagsinput('destroy');</code></pre>
                </td>
            </tr>
            </tbody>
        </table>
    </section>

    <section id="methods">
        <div class="page-header">
            <h2>Events</h2>
        </div>
        <table class="table table-bordered table-condensed">
            <thead>
            <tr>
                <th>event</th>
                <th>description</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><code>beforeItemAdd</code></td>
                <td>
                    Triggered just before an item gets added. Example:
                    <pre><code data-language="javascript">$('input').on('beforeItemAdd', function(event) {
  // event.item: contains the item
  // event.cancel: set to true to prevent the item getting added
});</code></pre>
                </td>
            </tr>
            <tr>
                <td><code>itemAdded</code></td>
                <td>
                    Triggered just after an item got added. Example:
                    <pre><code data-language="javascript">$('input').on('itemAdded', function(event) {
  // event.item: contains the item
});</code></pre>
                </td>
            </tr>
            <tr>
                <td><code>beforeItemRemove</code></td>
                <td>
                    Triggered just before an item gets removed. Example:
                    <pre><code data-language="javascript">$('input').on('beforeItemRemove', function(event) {
  // event.item: contains the item
  // event.cancel: set to true to prevent the item getting removed
});</code></pre>
                </td>
            </tr>
            <tr>
                <td><code>itemRemoved</code></td>
                <td>
                    Triggered just after an item got removed. Example:
                    <pre><code data-language="javascript">$('input').on('itemRemoved', function(event) {
  // event.item: contains the item
});</code></pre>
                </td>
            </tr>
            </tbody>
        </table>
    </section>
</div>
<footer class="footer">
    <p>Code licensed under <a href="https://raw.github.com/TimSchlechter/bootstrap-tagsinput/master/LICENSE" target="_blank">MIT License</a></p>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.20/angular.min.js"></script>
<script src="../dist/bootstrap-tagsinput.min.js"></script>
<script src="../dist/bootstrap-tagsinput/bootstrap-tagsinput-angular.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/js/rainbow.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/js/language/generic.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/js/language/html.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/js/language/javascript.js"></script>
<script src="assets/app_bs2.js"></script>
<script src="assets/app.js"></script>
</body>
</html></title>
</head>
<body>

</body>
</html>