# DCSS 
Simple way to documenting CSS and generating styleguide in your rails app

## Description
This ruby gem inspired by [KSS](https://github.com/kneath/kss) and [TomDoc](http://tomdoc.org/) two projects. DCSS is provided more a flexible methodology to write CSS documentations within SCSS file.

## Install
    sudo gem install dcss

## How to use DCSS
*The format*
The basic format for DCSS documentation can be best explained in an example:

Following DCSS documentation block available,
:description:, :html:, :modifiers:, :version:, :experimental:, :deprecated:, :compatible:

    /* 
      :description: 
      This is Buttons styles sheet 

      :modifiers:
      .btn    - Standard button with gradient
      .btn-success - Green button (Indicates a successful or positive action)

      :html:
      <div>
        <p>Exmaple</p>
      </div>

      :experimental:
      This CSS [experimental.css] is not available for development

      :deprecated:
      We'll drop support for these elements from July 30, 2012. See the commit [ULR](http://sources.com/path/to/20120830/commit)

      :compatible: 
      in IE6+, Firefox 2+, Safari 4+.

      :styleguide: 1.0
    */

    .btn {
      display: inline-block;
    }

    .btn:hover {
      text-decoration: none;
    }

    .btn.active, .btn:active {
      text-decoration: none;
    }

## Ruby API methods
This ruby library use only with SCSS files. Once you installed the gem, you need to create a parser and retrieve your DCSS blocks

    doc = Dcss::Doc.new("path/to/your/project/public/stylesheets")
    # => <Dcss::Doc>

    doc.section('exmaple') 
    # Here "exmple" means that specific file inside of /stylesheets/ derectory :eg example.scss
    # => <Dcss::Section>

    doc.section('exmaple').description
    # => "Description block return as text"

    doc.section('exmaple').modifiers
    # => [<Dcss::Modifier>, <Dcss::Modifier>]

    doc.section('exmaple').modifiers.first.name
    # => '.btn'

    doc.section('exmaple').modifiers.first.description
    # => 'Standard button with gradient'

    doc.section('exmaple').html
    # => 'HTML block is returned'

    doc.section('exmaple').experimental
    # => "Returns experimental block"

    doc.section('exmaple').compatible
    # => "Returns compatible block"
  
    doc.section('exmaple').version
    # => "Returns version number of styleguides"

##  Creating styleguides
For an example of how to generate a styleguide, check out the [example](http://github.com/nuwansh/rails-dss) rails application.

## Credit
This gem has been used some code directly from [KSS](https://github.com/kneath/kss).

## Copyright

Copyright (c) 2012 Nuwan Sameera. See LICENSE.txt for
further details.

