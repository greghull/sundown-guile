Sundown-guile
=======

`Sundown-guile` is a Markdown parser for guile based on
[Sundown](https://github.com/vmg/sundown) by Vicent Marti.  His work is based on the original code of the
[Upskirt library](http://fossil.instinctive.eu/libupskirt/index) by Natacha Porté.

Install
-------
The source for the Sundown shared library and the Sundown-guile package are both contained in this reposity.  The only external dependency is Guile itself.

Use the included Makefile to perform a site installation. You may need to specify the location of your Guile header files.

The guile package, including the libsundown-guile shared library, will be installed in the proper guile site directory.

Usage
------
Using the library from Guile is easy and straight-forward:

    scheme@(guile-user)> (use-modules (sundown markdown))
    scheme@(guile-user)> (markdown "Hello, world!")
    $42 = "<p>Hello, world!</p>\n"
    
    scheme@(guile-user)> (define who "world")
    scheme@(guile-user)> (md "1. Hello, " who "!")
    $43 = "<ol>\n<li>Hello,  world !</li>\n</ol>\n"
    
    scheme@(guile-user)> (format/md #t "#Hello, ~a!" 'world)
    <h1>Hello, world!</h1>
    $44 = #t

Credits
-------

`Sundown-guile` is a simple Guile wrapper around the `C` library `Sundown`.  The Guile wrapper was written by Gregory Hull.

`Sundown` is based on the original Upskirt parser by Natacha Porté, with many additions
by Vicent Marti (@vmg) and contributions from the following authors:

	Ben Noordhuis, Bruno Michel, Joseph Koshy, Krzysztof Kowalczyk, Samuel Bronson,
	Shuhei Tanuma

Features (from the [Sundown](https://github.com/vmg/sundown)  README)
--------

*	**Fully standards compliant**

	`Sundown` passes out of the box the official Markdown v1.0.0 and v1.0.3
	test suites, and has been extensively tested with additional corner cases
	to make sure its output is as sane as possible at all times.

*	**Massive extension support**

	`Sundown` has optional support for several (unofficial) Markdown extensions,
	such as non-strict emphasis, fenced code blocks, tables, autolinks,
	strikethrough and more.

*	**UTF-8 aware**

	`Sundown` is fully UTF-8 aware, both when parsing the source document and when
	generating the resulting (X)HTML code.

*	**Tested & Ready to be used on production**

	`Sundown` has been extensively security audited, and includes protection against
	all possible DOS attacks (stack overflows, out of memory situations, malformed
	Markdown syntax...) and against client attacks through malicious embedded HTML.

	We've worked very hard to make `Sundown` never crash or run out of memory
	under *any* input. `Sundown` renders all the Markdown content in GitHub and so
	far hasn't crashed a single time.

*	**Customizable renderers**

	`Sundown` is not stuck with XHTML output: the Markdown parser of the library
	is decoupled from the renderer, so it's trivial to extend the library with
	custom renderers. A fully functional (X)HTML renderer is included.

*	**Optimized for speed**

	`Sundown` is written in C, with a special emphasis on performance. When wrapped
	on a dynamic language such as Python or Ruby, it has shown to be up to 40
	times faster than other native alternatives.

*	**Zero-dependency**

	`Sundown` is a zero-dependency library composed of 3 `.c` files and their headers.
	No dependencies. Only standard C99 that builds everywhere.


License
-------

Sundown-guile is free software; you can redistribute it and/or modify 
it under the terms of the GNU Lesser General Public License as 
published by the Free Software Foundation; either version 2.1 of 
the License, or (at your option) any later version. 

Sundown-guile is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
GNU Lesser General Public License for more details. 

You should have received a copy of the GNU Lesser General Public 
License along with this program; if not, see <http://www.gnu.org/licenses/> 
