=TUL_IR

TUL_IR is the Temple University Libraries' version of Sufia, a lightly-customized version intended for use as a repository with LDAP authentication and some light front-end customizations.  

See the [documentation for Sufia](https://github.com/projecthydra/sufia) for information on getting all of the required pieces working.

==Additional Requirement

For use with LDAP, this Hydra application also requires the following packages to be installed on the server:
* ldap-utils
* slapd

The following packages are useful for testing LDAP bind credentials and getting needed information for creating the LDAP config.

* ldapwhoami
* ldapsearch

==Installation

To install and set up with correctly generated databases, run the following:

After cloning the repository, from within the Rails application's root directory:
```bash
bundle install
rails generate sufia:install -f
```
Decline to override all conflicts to keep all TUL_IR customizations in place

```bash
rake db:reset
```
Ignore or delete all migrations in db/migrations created by the sufia:install generator.  There should be only 7 of these created by that command though, so if there are more, you may need to drop and reset the database again.
NOTE: f you're still seeing db-related errors (for example, missing tables) after running the above rake task, you may need to restart your rails server to see the db changes you just made take effect.

Finally, don't forget to add and start jetty
```bash
rake jetty:clean
rake sufia:jetty:config
rake jetty:start
rails s
```