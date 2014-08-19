chef-automysqlbackup
====================
[![GitHub tag](http://img.shields.io/github/tag/ffuenf/chef-automysqlbackup.svg)][tag]
[![Build Status](http://img.shields.io/travis/ffuenf/chef-automysqlbackup.svg)][travis]
[![Gittip](http://img.shields.io/gittip/arosenhagen.svg)][gittip]

[tag]: https://github.com/ffuenf/chef-automysqlbackup/tags
[travis]: https://travis-ci.org/ffuenf/chef-automysqlbackup
[gittip]: https://www.gittip.com/arosenhagen


chef-automysqlbackup installs and configures [automysqlbackup](http://sourceforge.net/projects/automysqlbackup/)

Dependencies
------------

This cookbook depends on the following community cookbooks.

* database
* mysql

Platform
--------

The following platforms are supported and tested:

* Debian 6.x
* Debian 7.x
* Ubuntu 14.04.x

Other Debian family distributions are assumed to work.

Development
-----------
1. Fork the repository from GitHub.
2. Clone your fork to your local machine:

        $ git clone git@github.com:USER/chef-automysqlbackup.git

3. Create a git branch

        $ git checkout -b my_bug_fix

4. **Write tests**
5. Make your changes/patches/fixes, committing appropriately
6. Run the tests: `foodcritic`, `rubocop`, `kitchen test`
7. Push your changes to GitHub
8. Open a Pull Request

Testing
-------

chef-automysqlbackup is on [Travis CI](http://travis-ci.org/ffuenf/chef-automysqlbackup) which tests against multiple Chef and Ruby versions.

The following Rake tasks are provided for automated testing of the cookbook:

* `rake rubocop` - Run [RuboCop] style and lint checks
* `rake foodcritic` - Run [Foodcritic] lint checks
* `rake integration` - Run [Test Kitchen] integration tests (provisions a
  Vagrant VM using this cookbook and then tests the infrastructure with
  [Serverspec])
* `rake test` - Run all tests

License and Author
------------------

- Author:: Achim Rosenhagen (<a.rosenhagen@ffuenf.de>)

- Copyright:: 2014, ffuenf

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
