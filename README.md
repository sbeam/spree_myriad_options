Spree Myriad Options
==================

This extension makes a few changes to the Spree data model and controller
logic, to let you create Products with many Option Types/Values, but not have
to maintain sets of Variants for each combination.

In other words, if you have a store where Products have 5 user-selectable
options, and each option has 10 potential values, and you want to offer every
combination of those options to customers, in a default Spree installation your
store admin would be faced with creating and maintaining 97,656,259 Variants -
just for that product.

This extension bypasses both the Variant/Option Value relationship, and the
Inventory management, to make that uneccessary. You just create the list of
Option Types and Option Values normally in Spree, and associate those as needed
to Products.

Changes to the Product add-to-cart form will list selections for each option as
a set of radio buttons.

Option Values also get a new 'adder' field, which is added to the line item
price when that option is selected and added to the cart.

Status
======

Version 0.0.2

Tests complete and passing.

Example
=======

Add to gemfile

    gem 'spree_myriad_options', :git => 'git://github.com/sbeam/spree_myriad_options.git'

Install

    $ bundle
    $ bundle exec rake railties:install:migrations FROM=spree_myriad_options
    $ bundle exec rake db:migrate

Restart Rails, and in your Products admin, add some Option Types and Values to
a Product (and remove any Variants - only the invisible 'master' Variant should
exist on a Product for this extension to affect it.

Then in the Product detail page you should see sets of radio buttons for each
configured option. Each cart/order view should display the selected options in
the line item detail.

Note, this extension might not jive with some others, like
`spree_variant_options` (although it's a great extension, it still would
require maintaining Variants for each option combination)

Contributions
-------------

More than welcome! any feedback, ideas, reports would be great. Patches should
come with green tests.

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the
specs to run against.

in Spree 1.1.2+, you should be able to do this -

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec guard

But, due to an issue with the dummy app generator and namespacing in
Spree 1.1.1 (see https://github.com/spree/spree/issues/1580) you will need to
create a barebones Spree site somewhere else and hook this engine to that for
testing. See `spec/spec_helper.rb` and change the `path_to_test_store` value.

Copyright (c) 2012 [Sam Beam, creator], released under the New BSD License

