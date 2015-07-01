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
  #:version (1 0)
  #:export (markdown))

(define sundown-lib (dynamic-link "libsundown.so"))
(dynamic-call "init_markdown" sundown-lib)
