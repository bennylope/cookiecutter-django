========
Scripts!
========

The scripts here are a collection of development and build related scripts for
running tests and linting code.

They are divided up into two sections, 'automatic' and 'manual' based on how
they are intended to be used. Note that they can be used in either way
depending on the circumstance.

Automated
=========

curly-spacing.sh
----------------

Lints Django templates (*not* pre-compiled Jade) for weirdly formatted Django
template tag delimitters.

django-url.sh
-------------

Lints Django templates for new style `url` tags.

pre-commit
----------

This is a Git hook used to run `flake8` to check for badly formatted Python
code and to perform basic static analysis on Python code, subject to the
constraints specified in the tox.ini file.

Follow the instructions in the script comments to install it.

Manual
======

check-links.sh
--------------

This is a convenience wrapper around `pylinkvalidate.py` and is used to crawl
different environments in search of broken links. Usage::

    ./check-links staging
    ./check-links production

It configures the domains for the script, additional options, and the HTTP
basic auth credentials for staging.
