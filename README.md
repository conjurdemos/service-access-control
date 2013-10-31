Service Access Control
======================

A live demonstration of http://developer.conjur.net/use-cases/service-access-control.html

Usage
-----

Generate the permissions model. The output is redirected to config.yml, which used by the web service and by the 
cucumber client testing code.

```bash
conjur script:execute -c conjur.json permissions-model.rb
```

Run the tests

```bash
cucumber
```
