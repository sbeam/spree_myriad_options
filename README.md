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

This extension bypasses the LineItem/Variant/Option Value relationship to make
that uneccessary. You just create the list of Option Types and Option Values
normally in Spree, and associate those as needed to Products. A LineItem then
has many OptionValue's directly, and only is tied to the 'master' variant for
that product.

Of course, with this extension, inventory is no longer tracked on a
per-option-combination (Variant) basis. It is only tracked per-product (Master
Variant).  The use case would assume that inventory is not important, or that
products are manufactured to order.

Changes to the Product add-to-cart form will list selections for each option as
a set of radio buttons.

In the admin, Option Values also get a new 'adder' field, which is added to the
line item price when that option is selected and added to the cart.

Option Values can also be set up by the admin with a "Customization Lines"
numeric value, which may be useful for "Engraving Message" or similar
user-entered text. This should result in the customer seeing the specified
number of fields below each option value, which they can fill out as needed.
There is as yet no validation on these user-generated values.


Status
======

0.1.0 - Tests complete and passing.
0.1.1 - bugfix for edge case
0.1.2 - Works with spree 1.1.3

Example
=======

Add to gemfile

    gem 'spree_myriad_options', :git => 'git://github.com/sbeam/spree_myriad_options.git'

Install

    $ bundle
    $ rails generate spree_myriad_options:install
    $ rake db:migrate # (if not run during install)

Restart Rails, and in your Products admin, add some Option Types and Values to
a Product (and remove any Variants - only the invisible 'master' Variant should
exist on a Product for this extension to affect it.

Then in the Product detail page you should see sets of radio buttons for each
configured option. Each cart/order view should display the selected options in
the line item detail.

Note, this extension might not jive with some others, like
`spree_variant_options` (although it's a great extension, it still would
require maintaining Variants for each option combination)

Similar Gems
------------

You might also want to look at
[spree_flexi_variants](https://github.com/jsqu99/spree_flexi_variants) which
has similar goals, and more features than this. Since our needs were simpler,
this was begun as a total rewrite that would simply provide a way around the
Variant maintance problem in Spree, no more no less. There are now a few more
features, but think of this as more a clean, well-tested blank-slate that can
be built upon to meet your app's needs, rather than a turnkey install-and-go
extension.

TODO
----

  * replace simple `option_value.customization_lines` with Customization
    classes, ie includable modules with field definitions and validation
    callbacks
  * (maybe) some JS to auto-update the price on the product detail form

Contributions
-------------

feedback, ideas, reports, new features and fixes would be great. Fork and
create a pull request. Patches should come with green tests.

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

