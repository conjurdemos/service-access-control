Service Access Control
======================

A live demonstration of http://developer.conjur.net/use-cases/service-access-control.html

Usage
=====

Generate the permissions model. Also creates config.yml which used by the web service and by the 
cucumber client testing code.

```bash
conjur script:execute permissions-model.rb
```

Run the tests

```bash
cucumber
```
