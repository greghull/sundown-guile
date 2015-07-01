;;   Copyright (C) 2015 Gregory Hull <greg.hull@gmail.com>

;;   This file is part of Sundown-guile,

;;   Sundown-guile is free software; you can redistribute it and/or modify
;;   it under the terms of the GNU Lesser General Public License as
;;   published by the Free Software Foundation; either version 2.1 of
;;   the License, or (at your option) any later version.

;;   Sundown-guile is distributed in the hope that it will be useful,
;;   but WITHOUT ANY WARRANTY; without even the implied warranty of
;;   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;   GNU Lesser General Public License for more details.

;;   You should have received a copy of the GNU Lesser General Public
;;   License along with this program; if not, see <http://www.gnu.org/licenses/>

(define-module (sundown markdown)
  #:version (1 1)
  #:use-module (ice-9 match)
  #:export (markdown
	    md
	    format/md))


(define sundown-lib (dynamic-link "libsundown.so"))
(dynamic-call "init_markdown" sundown-lib)

(define* (md str . rest)
  "- Scheme Procedure: md str . rest
Applies the markdown transformation to all of it's arguments.  Arguments are joined together
and presented to the markdown functions as one continuous string."
  (match rest
    (#f (markdown str))
    ((lst ...) (markdown (string-join (cons str lst))))))

(define* (format/md port fmt . args)
  "- Scheme Procedure: format/md dest fmt . args
Parameters are the same as with the format function, but markdown transformation is applied before writing to dest."
  (format port "~a" (markdown (apply format #f fmt args))))
