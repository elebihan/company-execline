`company-execline`: Company backend for execline scripts
========================================================

A company backend for
[execline](http://skarnet.org/software/execline/index.html) scripts.

## Manual Installation

To install manually, check out this repository and add this to your
`.emacs` file:

```lisp
(add-to-list 'load-path "/path/to/company-execline/")
(require 'company-execline')

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-execline))
```

## License

`company-execline` is distributed under the terms of the GNU General Public
License (Version 3.0).

See [LICENSE](LICENSE) for details.
