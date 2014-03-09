Service Access Control
======================

A live demonstration of http://developer.conjur.net/use-cases/service-access-control.html

Usage
-----

Generate the permissions model. The context is saved to conjur.json, which used by the web service and by the 
cucumber client testing code.

```bash
bundle install
bundle exec conjur policy:load -c conjur.json policy.rb
```

Run the tests

```bash
bundle exec cucumber
```
